-- ============================================================
--  25 SQL Analytics Queries — Cricbuzz LiveStats
--  (Reference copy. The Streamlit app loads these from
--   sql/queries.py so they can be run with parameters.)
-- ============================================================

-- Q1 (Beginner) Players who represent India
SELECT full_name, playing_role, batting_style, bowling_style
FROM players
WHERE country = 'India';

-- Q2 (Beginner) Matches played in the last 30 days
SELECT m.match_description, t1.team_name AS team1, t2.team_name AS team2,
       v.venue_name, v.city, m.match_date
FROM matches m
JOIN teams t1 ON t1.team_id = m.team1_id
JOIN teams t2 ON t2.team_id = m.team2_id
LEFT JOIN venues v ON v.venue_id = m.venue_id
WHERE m.match_date >= CURDATE() - INTERVAL 30 DAY
ORDER BY m.match_date DESC;

-- Q3 (Beginner) Top 10 highest ODI run scorers
SELECT full_name, total_runs, batting_average, centuries
FROM player_batting_career
WHERE match_format = 'ODI'
ORDER BY total_runs DESC
LIMIT 10;

-- Q4 (Beginner) Venues with capacity > 50,000
SELECT venue_name, city, country, capacity
FROM venues
WHERE capacity > 50000
ORDER BY capacity DESC;

-- Q5 (Beginner) Matches won per team
SELECT t.team_name, COUNT(*) AS total_wins
FROM matches m
JOIN teams t ON t.team_id = m.winning_team_id
GROUP BY t.team_name
ORDER BY total_wins DESC;

-- Q6 (Beginner) Player count per role
SELECT playing_role, COUNT(*) AS player_count
FROM players
GROUP BY playing_role;

-- Q7 (Beginner) Highest individual score per format
SELECT m.match_format, MAX(b.runs_scored) AS highest_score
FROM batting_stats b
JOIN matches m ON m.match_id = b.match_id
GROUP BY m.match_format;

-- Q8 (Beginner) Series started in 2024
SELECT series_name, host_country, match_type, start_date, total_matches
FROM series
WHERE YEAR(start_date) = 2024;

-- Q9 (Intermediate) All-rounders with >1000 runs AND >50 wickets
SELECT p.full_name, bc.total_runs, bw.total_wickets, bc.match_format
FROM player_batting_career bc
JOIN player_bowling_career bw
  ON bw.player_id = bc.player_id AND bw.match_format = bc.match_format
JOIN players p ON p.player_id = bc.player_id
WHERE bc.total_runs > 1000 AND bw.total_wickets > 50;

-- Q10 (Intermediate) Last 20 completed matches
SELECT m.match_description, t1.team_name AS team1, t2.team_name AS team2,
       tw.team_name AS winning_team, m.victory_margin, m.victory_type, v.venue_name
FROM matches m
JOIN teams t1 ON t1.team_id = m.team1_id
JOIN teams t2 ON t2.team_id = m.team2_id
LEFT JOIN teams tw ON tw.team_id = m.winning_team_id
LEFT JOIN venues v ON v.venue_id = m.venue_id
WHERE m.match_status = 'Completed'
ORDER BY m.match_date DESC
LIMIT 20;

-- Q11 (Intermediate) Cross-format comparison, players with >=2 formats
WITH player_format_runs AS (
    SELECT b.player_id, m.match_format, SUM(b.runs_scored) AS runs
    FROM batting_stats b JOIN matches m ON m.match_id = b.match_id
    GROUP BY b.player_id, m.match_format
),
overall AS (
    SELECT player_id, SUM(runs_scored) AS total_runs,
           SUM(CASE WHEN is_out THEN 1 ELSE 0 END) AS dismissals
    FROM batting_stats GROUP BY player_id
)
SELECT p.full_name,
    SUM(CASE WHEN pfr.match_format='Test' THEN pfr.runs ELSE 0 END) AS test_runs,
    SUM(CASE WHEN pfr.match_format='ODI'  THEN pfr.runs ELSE 0 END) AS odi_runs,
    SUM(CASE WHEN pfr.match_format='T20I' THEN pfr.runs ELSE 0 END) AS t20i_runs,
    ROUND(o.total_runs / NULLIF(o.dismissals,0), 2) AS overall_batting_average
FROM player_format_runs pfr
JOIN players p ON p.player_id = pfr.player_id
JOIN overall o ON o.player_id = pfr.player_id
GROUP BY p.player_id, p.full_name, o.total_runs, o.dismissals
HAVING COUNT(DISTINCT pfr.match_format) >= 2;

-- Q12 (Intermediate) Home vs away wins
WITH team_matches AS (
    SELECT m.match_id, m.winning_team_id, m.team1_id AS team_id,
           v.country AS venue_country, t.country AS team_country
    FROM matches m JOIN teams t ON t.team_id = m.team1_id
    LEFT JOIN venues v ON v.venue_id = m.venue_id
    UNION ALL
    SELECT m.match_id, m.winning_team_id, m.team2_id AS team_id,
           v.country AS venue_country, t.country AS team_country
    FROM matches m JOIN teams t ON t.team_id = m.team2_id
    LEFT JOIN venues v ON v.venue_id = m.venue_id
)
SELECT t.team_name,
    SUM(CASE WHEN tm.venue_country = tm.team_country AND tm.winning_team_id = tm.team_id THEN 1 ELSE 0 END) AS home_wins,
    SUM(CASE WHEN tm.venue_country <> tm.team_country AND tm.winning_team_id = tm.team_id THEN 1 ELSE 0 END) AS away_wins
FROM team_matches tm
JOIN teams t ON t.team_id = tm.team_id
GROUP BY t.team_name;

-- Q13 (Intermediate) Partnerships >= 100 runs
SELECT p1.full_name AS player1, p2.full_name AS player2,
       pt.partnership_runs, pt.innings_number, pt.match_id
FROM partnerships pt
JOIN players p1 ON p1.player_id = pt.player1_id
JOIN players p2 ON p2.player_id = pt.player2_id
WHERE pt.partnership_runs >= 100
ORDER BY pt.partnership_runs DESC;

-- Q14 (Intermediate) Bowling performance by venue (>=3 matches at venue, >=4 overs/match)
WITH bowler_venue AS (
    SELECT bw.player_id, m.venue_id,
           COUNT(DISTINCT bw.match_id) AS matches_at_venue,
           SUM(bw.wickets_taken) AS total_wickets,
           AVG(bw.economy_rate) AS avg_economy
    FROM bowling_stats bw JOIN matches m ON m.match_id = bw.match_id
    WHERE bw.overs_bowled >= 4
    GROUP BY bw.player_id, m.venue_id
)
SELECT p.full_name, v.venue_name, bvn.matches_at_venue, bvn.total_wickets,
       ROUND(bvn.avg_economy,2) AS avg_economy_rate
FROM bowler_venue bvn
JOIN players p ON p.player_id = bvn.player_id
JOIN venues v ON v.venue_id = bvn.venue_id
WHERE bvn.matches_at_venue >= 3;

-- Q15 (Intermediate) Performance in close matches (<50 runs or <5 wickets margin)
WITH close_matches AS (
    SELECT match_id, winning_team_id
    FROM matches
    WHERE (victory_type = 'runs' AND victory_margin < 50)
       OR (victory_type = 'wickets' AND victory_margin < 5)
)
SELECT p.full_name,
    ROUND(AVG(b.runs_scored),2) AS avg_runs_in_close_matches,
    COUNT(DISTINCT b.match_id) AS close_matches_played,
    SUM(CASE WHEN p.team_id = cm.winning_team_id THEN 1 ELSE 0 END) AS close_matches_won_while_batting
FROM close_matches cm
JOIN batting_stats b ON b.match_id = cm.match_id
JOIN players p ON p.player_id = b.player_id
GROUP BY p.player_id, p.full_name;

-- Q16 (Intermediate) Yearly performance since 2020 (>=5 matches/year)
SELECT p.full_name, YEAR(m.match_date) AS year,
       ROUND(AVG(b.runs_scored),2) AS avg_runs_per_match,
       ROUND(AVG(b.strike_rate),2) AS avg_strike_rate,
       COUNT(DISTINCT b.match_id) AS matches_played
FROM batting_stats b
JOIN matches m ON m.match_id = b.match_id
JOIN players p ON p.player_id = b.player_id
WHERE m.match_date >= '2020-01-01'
GROUP BY p.player_id, p.full_name, YEAR(m.match_date)
HAVING COUNT(DISTINCT b.match_id) >= 5;

-- Q17 (Advanced) Toss advantage
SELECT m.toss_decision,
    COUNT(*) AS total_matches,
    SUM(CASE WHEN m.toss_winner_id = m.winning_team_id THEN 1 ELSE 0 END) AS toss_winner_also_won,
    ROUND(100.0 * SUM(CASE WHEN m.toss_winner_id = m.winning_team_id THEN 1 ELSE 0 END) / COUNT(*), 2) AS win_percentage
FROM matches m
WHERE m.toss_winner_id IS NOT NULL AND m.winning_team_id IS NOT NULL
GROUP BY m.toss_decision;

-- Q18 (Advanced) Most economical limited-overs bowlers (>=10 matches, >=2 overs/match avg)
WITH bowler_agg AS (
    SELECT bw.player_id,
        COUNT(DISTINCT bw.match_id) AS matches_played,
        SUM(bw.overs_bowled) AS total_overs,
        SUM(bw.runs_conceded) AS total_runs,
        SUM(bw.wickets_taken) AS total_wickets
    FROM bowling_stats bw JOIN matches m ON m.match_id = bw.match_id
    WHERE m.match_format IN ('ODI','T20I')
    GROUP BY bw.player_id
)
SELECT p.full_name, ba.matches_played, ba.total_wickets,
       ROUND(ba.total_runs / ba.total_overs, 2) AS economy_rate
FROM bowler_agg ba
JOIN players p ON p.player_id = ba.player_id
WHERE ba.matches_played >= 10 AND (ba.total_overs / ba.matches_played) >= 2
ORDER BY economy_rate ASC;

-- Q19 (Advanced) Most consistent batsmen (stddev), since 2022, >=10 balls faced
SELECT p.full_name,
    ROUND(AVG(b.runs_scored),2) AS avg_runs,
    ROUND(STDDEV(b.runs_scored),2) AS runs_stddev
FROM batting_stats b
JOIN matches m ON m.match_id = b.match_id
JOIN players p ON p.player_id = b.player_id
WHERE m.match_date >= '2022-01-01' AND b.balls_faced >= 10
GROUP BY p.player_id, p.full_name
ORDER BY runs_stddev ASC;

-- Q20 (Advanced) Matches/averages per format, players with >=20 total matches
WITH per_format AS (
    SELECT b.player_id, m.match_format,
        COUNT(DISTINCT b.match_id) AS matches_in_format,
        ROUND(SUM(b.runs_scored) / NULLIF(SUM(CASE WHEN b.is_out THEN 1 ELSE 0 END),0), 2) AS batting_avg
    FROM batting_stats b JOIN matches m ON m.match_id = b.match_id
    GROUP BY b.player_id, m.match_format
),
totals AS (
    SELECT player_id, SUM(matches_in_format) AS total_matches
    FROM per_format GROUP BY player_id
)
SELECT p.full_name,
    MAX(CASE WHEN pf.match_format='Test' THEN pf.matches_in_format ELSE 0 END) AS test_matches,
    MAX(CASE WHEN pf.match_format='ODI'  THEN pf.matches_in_format ELSE 0 END) AS odi_matches,
    MAX(CASE WHEN pf.match_format='T20I' THEN pf.matches_in_format ELSE 0 END) AS t20_matches,
    MAX(CASE WHEN pf.match_format='Test' THEN pf.batting_avg END) AS test_avg,
    MAX(CASE WHEN pf.match_format='ODI'  THEN pf.batting_avg END) AS odi_avg,
    MAX(CASE WHEN pf.match_format='T20I' THEN pf.batting_avg END) AS t20_avg
FROM per_format pf
JOIN players p ON p.player_id = pf.player_id
JOIN totals t ON t.player_id = pf.player_id
WHERE t.total_matches >= 20
GROUP BY p.player_id, p.full_name;

-- Q21 (Advanced) Comprehensive weighted performance ranking
WITH batting AS (
    SELECT b.player_id, m.match_format,
        SUM(b.runs_scored) AS runs_scored,
        ROUND(SUM(b.runs_scored) / NULLIF(SUM(CASE WHEN b.is_out THEN 1 ELSE 0 END),0), 2) AS batting_average,
        ROUND(AVG(b.strike_rate),2) AS strike_rate
    FROM batting_stats b JOIN matches m ON m.match_id = b.match_id
    GROUP BY b.player_id, m.match_format
),
bowling AS (
    SELECT bw.player_id, m.match_format,
        SUM(bw.wickets_taken) AS wickets_taken,
        ROUND(SUM(bw.runs_conceded) / NULLIF(SUM(bw.wickets_taken),0), 2) AS bowling_average,
        ROUND(SUM(bw.runs_conceded) / NULLIF(SUM(bw.overs_bowled),0), 2) AS economy_rate
    FROM bowling_stats bw JOIN matches m ON m.match_id = bw.match_id
    GROUP BY bw.player_id, m.match_format
),
fielding AS (
    SELECT player_id, SUM(catches) AS catches, SUM(stumpings) AS stumpings
    FROM fielding_stats GROUP BY player_id
)
SELECT p.full_name, bat.match_format,
    ROUND(
        (bat.runs_scored * 0.01) + (bat.batting_average * 0.5) + (bat.strike_rate * 0.3)
      + (COALESCE(bwl.wickets_taken,0) * 2) + ((50 - COALESCE(bwl.bowling_average,50)) * 0.5)
      + ((6 - COALESCE(bwl.economy_rate,6)) * 2)
      + (COALESCE(f.catches,0) * 3) + (COALESCE(f.stumpings,0) * 5)
    , 2) AS total_score
FROM batting bat
JOIN players p ON p.player_id = bat.player_id
LEFT JOIN bowling bwl ON bwl.player_id = bat.player_id AND bwl.match_format = bat.match_format
LEFT JOIN fielding f ON f.player_id = bat.player_id
ORDER BY bat.match_format, total_score DESC;

-- Q22 (Advanced) Head-to-head analysis, last 3 years, >=5 matches
WITH h2h AS (
    SELECT match_id, team1_id, team2_id, winning_team_id, victory_margin, victory_type
    FROM matches
    WHERE match_date >= CURDATE() - INTERVAL 3 YEAR
)
SELECT t1.team_name AS team_a, t2.team_name AS team_b,
    COUNT(*) AS total_matches,
    SUM(CASE WHEN h.winning_team_id = h.team1_id THEN 1 ELSE 0 END) AS team_a_wins,
    SUM(CASE WHEN h.winning_team_id = h.team2_id THEN 1 ELSE 0 END) AS team_b_wins,
    ROUND(AVG(CASE WHEN h.winning_team_id = h.team1_id THEN h.victory_margin END), 2) AS avg_margin_team_a_win,
    ROUND(AVG(CASE WHEN h.winning_team_id = h.team2_id THEN h.victory_margin END), 2) AS avg_margin_team_b_win,
    ROUND(100.0 * SUM(CASE WHEN h.winning_team_id = h.team1_id THEN 1 ELSE 0 END) / COUNT(*), 2) AS team_a_win_pct,
    ROUND(100.0 * SUM(CASE WHEN h.winning_team_id = h.team2_id THEN 1 ELSE 0 END) / COUNT(*), 2) AS team_b_win_pct
FROM h2h h
JOIN teams t1 ON t1.team_id = h.team1_id
JOIN teams t2 ON t2.team_id = h.team2_id
GROUP BY t1.team_name, t2.team_name
HAVING COUNT(*) >= 5;

-- Q23 (Advanced) Recent form & momentum (last 10 innings)
WITH ranked AS (
    SELECT b.player_id, b.runs_scored, b.strike_rate, m.match_date,
        ROW_NUMBER() OVER (PARTITION BY b.player_id ORDER BY m.match_date DESC) AS rn
    FROM batting_stats b JOIN matches m ON m.match_id = b.match_id
)
SELECT p.full_name,
    ROUND(AVG(CASE WHEN rn<=5  THEN runs_scored END), 2) AS avg_runs_last5,
    ROUND(AVG(CASE WHEN rn<=10 THEN runs_scored END), 2) AS avg_runs_last10,
    ROUND(AVG(CASE WHEN rn<=10 THEN strike_rate END), 2) AS recent_strike_rate,
    SUM(CASE WHEN rn<=10 AND runs_scored > 50 THEN 1 ELSE 0 END) AS scores_above_50,
    ROUND(STDDEV(CASE WHEN rn<=10 THEN runs_scored END), 2) AS consistency_stddev,
    CASE
        WHEN AVG(CASE WHEN rn<=10 THEN runs_scored END) >= 50 THEN 'Excellent Form'
        WHEN AVG(CASE WHEN rn<=10 THEN runs_scored END) >= 35 THEN 'Good Form'
        WHEN AVG(CASE WHEN rn<=10 THEN runs_scored END) >= 20 THEN 'Average Form'
        ELSE 'Poor Form'
    END AS form_category
FROM ranked
JOIN players p ON p.player_id = ranked.player_id
WHERE rn <= 10
GROUP BY p.player_id, p.full_name;

-- Q24 (Advanced) Most successful batting partnerships (consecutive positions, >=5 partnerships)
SELECT p1.full_name AS player1, p2.full_name AS player2,
    COUNT(*) AS total_partnerships,
    ROUND(AVG(pt.partnership_runs), 2) AS avg_partnership_runs,
    SUM(CASE WHEN pt.partnership_runs > 50 THEN 1 ELSE 0 END) AS partnerships_above_50,
    MAX(pt.partnership_runs) AS highest_partnership,
    ROUND(100.0 * SUM(CASE WHEN pt.partnership_runs > 50 THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_pct
FROM partnerships pt
JOIN players p1 ON p1.player_id = pt.player1_id
JOIN players p2 ON p2.player_id = pt.player2_id
WHERE ABS(pt.position1 - pt.position2) = 1
GROUP BY p1.player_id, p2.player_id, p1.full_name, p2.full_name
HAVING COUNT(*) >= 5
ORDER BY avg_partnership_runs DESC;

-- Q25 (Advanced) Time-series career trajectory (quarterly, >=6 quarters, >=3 matches/quarter)
WITH quarterly AS (
    SELECT b.player_id, YEAR(m.match_date) AS yr, QUARTER(m.match_date) AS qtr,
        AVG(b.runs_scored) AS avg_runs, AVG(b.strike_rate) AS avg_sr,
        COUNT(DISTINCT b.match_id) AS matches_in_quarter
    FROM batting_stats b JOIN matches m ON m.match_id = b.match_id
    GROUP BY b.player_id, YEAR(m.match_date), QUARTER(m.match_date)
    HAVING COUNT(DISTINCT b.match_id) >= 3
),
with_prev AS (
    SELECT q.*, LAG(avg_runs) OVER (PARTITION BY player_id ORDER BY yr, qtr) AS prev_avg_runs
    FROM quarterly q
),
player_quarters AS (
    SELECT player_id, COUNT(*) AS num_quarters,
        AVG(CASE WHEN prev_avg_runs IS NOT NULL AND avg_runs > prev_avg_runs THEN 1
                 WHEN prev_avg_runs IS NOT NULL THEN 0 END) AS improving_ratio
    FROM with_prev
    GROUP BY player_id
    HAVING COUNT(*) >= 6
)
SELECT p.full_name, pq.num_quarters,
    ROUND(pq.improving_ratio * 100, 2) AS pct_quarters_improved,
    CASE
        WHEN pq.improving_ratio >= 0.6 THEN 'Career Ascending'
        WHEN pq.improving_ratio <= 0.4 THEN 'Career Declining'
        ELSE 'Career Stable'
    END AS career_phase
FROM player_quarters pq
JOIN players p ON p.player_id = pq.player_id;
