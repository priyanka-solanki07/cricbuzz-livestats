-- ============================================================
--  Sample seed data — Cricbuzz LiveStats
--  Run AFTER schema.sql. Gives you enough multi-year data to
--  test all 25 analytics queries immediately.
--  NOTE: This is synthetic sample data for practice/testing —
--  replace with real synced API data whenever you're ready.
-- ============================================================

USE cricbuzz_livestats;

-- Teams
INSERT INTO teams (team_name, country) VALUES ('India', 'India');
INSERT INTO teams (team_name, country) VALUES ('Australia', 'Australia');
INSERT INTO teams (team_name, country) VALUES ('England', 'England');
INSERT INTO teams (team_name, country) VALUES ('South Africa', 'South Africa');
INSERT INTO teams (team_name, country) VALUES ('New Zealand', 'New Zealand');
INSERT INTO teams (team_name, country) VALUES ('Pakistan', 'Pakistan');

-- Venues
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('Melbourne Cricket Ground', 'Melbourne', 'Australia', 100024);
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('Narendra Modi Stadium', 'Ahmedabad', 'India', 132000);
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('Lord''s', 'London', 'England', 30000);
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('Eden Gardens', 'Kolkata', 'India', 68000);
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('The Wanderers Stadium', 'Johannesburg', 'South Africa', 34000);
INSERT INTO venues (venue_name, city, country, capacity) VALUES ('Basin Reserve', 'Wellington', 'New Zealand', 11600);

-- Players
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Rohit Sharma', 'India', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='India'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Virat Kohli', 'India', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='India'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Jasprit Bumrah', 'India', 'Bowler', 'Right-hand bat', 'Right-arm fast', (SELECT team_id FROM teams WHERE team_name='India'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Ravindra Jadeja', 'India', 'All-rounder', 'Left-hand bat', 'Left-arm orthodox', (SELECT team_id FROM teams WHERE team_name='India'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Rishabh Pant', 'India', 'Wicket-keeper', 'Left-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='India'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Steve Smith', 'Australia', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='Australia'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Pat Cummins', 'Australia', 'Bowler', 'Right-hand bat', 'Right-arm fast', (SELECT team_id FROM teams WHERE team_name='Australia'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Glenn Maxwell', 'Australia', 'All-rounder', 'Right-hand bat', 'Right-arm off break', (SELECT team_id FROM teams WHERE team_name='Australia'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('David Warner', 'Australia', 'Batsman', 'Left-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='Australia'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Alex Carey', 'Australia', 'Wicket-keeper', 'Left-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='Australia'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Joe Root', 'England', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='England'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('James Anderson', 'England', 'Bowler', 'Left-hand bat', 'Right-arm fast', (SELECT team_id FROM teams WHERE team_name='England'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Ben Stokes', 'England', 'All-rounder', 'Left-hand bat', 'Right-arm fast medium', (SELECT team_id FROM teams WHERE team_name='England'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Jos Buttler', 'England', 'Wicket-keeper', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='England'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Kagiso Rabada', 'South Africa', 'Bowler', 'Right-hand bat', 'Right-arm fast', (SELECT team_id FROM teams WHERE team_name='South Africa'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Quinton de Kock', 'South Africa', 'Wicket-keeper', 'Left-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='South Africa'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Aiden Markram', 'South Africa', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='South Africa'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Kane Williamson', 'New Zealand', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='New Zealand'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Trent Boult', 'New Zealand', 'Bowler', 'Right-hand bat', 'Left-arm fast medium', (SELECT team_id FROM teams WHERE team_name='New Zealand'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Babar Azam', 'Pakistan', 'Batsman', 'Right-hand bat', NULL, (SELECT team_id FROM teams WHERE team_name='Pakistan'));
INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id) VALUES ('Shaheen Afridi', 'Pakistan', 'Bowler', 'Left-hand bat', 'Left-arm fast', (SELECT team_id FROM teams WHERE team_name='Pakistan'));

-- Series
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('Border-Gavaskar Trophy 2019', 'Australia', 'Test', '2019-12-05', 4);
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('India tour of England 2021', 'England', 'Test', '2021-08-04', 5);
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('T20 World Cup 2022', 'Australia', 'T20I', '2022-10-16', 45);
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('ODI World Cup 2023', 'India', 'ODI', '2023-10-05', 48);
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('Border-Gavaskar Trophy 2024', 'Australia', 'Test', '2024-12-06', 5);
INSERT INTO series (series_name, host_country, match_type, start_date, total_matches) VALUES ('Champions Trophy 2025', 'Pakistan', 'ODI', '2025-02-19', 15);

-- Matches, batting/bowling/fielding stats, partnerships
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs India, T20I #1', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2022-01-31',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    40, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 26, 26, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 28, 46, 1, 0, 60.87, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 23, 34, 1, 0, 67.65, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 81, 81, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 17, 17, 1, 0, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 49, 59, 2, 1, 83.05, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 29, 31, 0, 0, 93.55, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 54;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 104;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 98;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 66;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 78;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 6.3, 37, 3, 5.95;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 5.0, 26, 2, 5.31;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 8.2, 61, 0, 7.44;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 7.8, 50, 0, 6.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 6.8, 32, 4, 4.75;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'England vs India, T20I #2', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2022-07-12',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 24, 26, 2, 0, 92.31, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 2, 5, 1, 0, 40.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 46, 70, 1, 1, 65.71, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 6, 11, 0, 0, 54.55, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 54, 68, 2, 0, 79.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 33, 49, 2, 0, 67.35, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 33, 33, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 34, 56, 0, 1, 60.71, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 0, 6, 1, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 26;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 52;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 87;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 66;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 67;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 9.3, 85, 0, 9.16;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 6.9, 23, 2, 3.45;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 8.6, 32, 1, 3.83;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 7.3, 34, 3, 4.72;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.5, 28, 1, 4.38;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.4, 36, 1, 4.31;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs Pakistan, T20I #3', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2019-08-30',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='India'),
    13, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 11, 21, 0, 0, 52.38, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 30, 40, 0, 0, 75.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 8, 9, 0, 0, 88.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 43, 45, 1, 0, 95.56, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 7, 10, 0, 0, 70.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 40, 60, 0, 0, 66.67, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 75, 75, 3, 1, 100.0, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 41;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 38;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 51;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 115;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.4, 38, 0, 4.07;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.3, 56, 2, 9.02;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5.7, 42, 2, 7.53;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.7, 63, 1, 7.3;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 5.1, 22, 0, 4.42;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs India, Test #4', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2025-09-03',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    108, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 10, 13, 0, 0, 76.92, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 12, 17, 0, 0, 70.59, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 23, 35, 1, 0, 65.71, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 35, 54, 0, 0, 64.81, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 30, 37, 1, 0, 81.08, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 22, 36, 0, 0, 61.11, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 42, 42, 2, 0, 100.0, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 22;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 58;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 65;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 52;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 8.5, 34, 0, 4.01;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 5.3, 27, 2, 5.23;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.1, 57, 0, 6.29;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 9.4, 31, 2, 3.33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 9.0, 29, 1, 3.29;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 1, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, Test #5', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2023-02-21',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    3, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 0, 1, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 75, 103, 6, 3, 72.82, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 31, 31, 0, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 0, 6, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 34, 58, 0, 0, 58.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 20, 27, 0, 0, 74.07, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 39, 62, 2, 1, 62.9, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 75;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 31;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 34;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 54;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 59;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 9.1, 46, 0, 5.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 9.3, 43, 1, 4.7;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 9.9, 32, 1, 3.25;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.1, 49, 1, 8.11;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 9.9, 37, 3, 3.75;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, ODI #6', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2019-10-14',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    2, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 52, 73, 3, 2, 71.23, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 50, 80, 4, 2, 62.5, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 50, 60, 2, 1, 83.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 39, 46, 3, 0, 84.78, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 0, 3, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 16, 26, 1, 0, 61.54, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 15, 15, 0, 0, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 102;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 89;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 39;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 16;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 31;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.6, 51, 3, 5.96;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.5, 57, 1, 7.67;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 6.4, 25, 2, 3.96;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 9.4, 80, 3, 8.59;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 8.7, 38, 3, 4.42;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs Pakistan, ODI #7', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2025-11-14',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    3, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 30, 47, 1, 0, 63.83, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 50, 50, 1, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 40, 40, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 25, 35, 1, 1, 71.43, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 80;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 65;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.0, 49, 2, 5.53;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 9.7, 30, 3, 3.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 7.5, 45, 4, 6.1;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 5.8, 32, 3, 5.53;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, Test #8', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2025-12-23',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 50, 50, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 52, 59, 2, 1, 88.14, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 36, 48, 1, 0, 75.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 34, 44, 0, 0, 77.27, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 18, 22, 0, 0, 81.82, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 19, 29, 0, 0, 65.52, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 36, 42, 3, 0, 85.71, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 102;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 52;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 37;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 55;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.1, 57, 0, 7.08;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 8.6, 73, 2, 8.53;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 4.7, 44, 2, 9.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.1, 35, 1, 5.78;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 7.0, 36, 3, 5.22;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs England, T20I #9', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2024-06-03',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    5, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 35, 52, 1, 1, 67.31, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 0, 1, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 39, 39, 2, 1, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 25, 25, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 12, 17, 1, 0, 70.59, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 52, 59, 2, 2, 88.14, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 35;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 64;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 37;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 6.8, 43, 1, 6.45;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 8.5, 43, 2, 5.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 5.6, 25, 0, 4.63;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 5.2, 19, 1, 3.78;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 8.6, 36, 0, 4.2;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs England, Test #10', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2025-03-16',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    168, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 34, 60, 1, 1, 56.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 0, 8, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 86, 86, 2, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 42, 47, 3, 0, 89.36, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 28, 37, 1, 1, 75.68, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 7, 13, 0, 0, 53.85, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 8, 9, 0, 0, 88.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 0, 4, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 42, 50, 2, 0, 84.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 34;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 86;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 128;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 15;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 8;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 7.3, 52, 3, 7.21;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 9.0, 31, 0, 3.46;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5.8, 45, 1, 7.87;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 5.7, 21, 2, 3.81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 8.2, 74, 1, 9.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 7.0, 24, 0, 3.52;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 1, 1, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs England, Test #11', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2020-12-18',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='England'),
    5, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 12, 15, 1, 0, 80.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 10, 10, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 17, 33, 0, 0, 51.52, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 90, 90, 6, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 7, 12, 1, 0, 58.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 25, 31, 0, 1, 80.65, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 22;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 107;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 97;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 32;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.2, 31, 4, 3.79;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.7, 35, 0, 4.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 7.3, 48, 0, 6.59;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 10.0, 89, 1, 8.93;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4.7, 39, 1, 8.41;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs Pakistan, Test #12', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2019-10-13',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    6, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 27, 41, 0, 1, 65.85, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 52, 61, 4, 1, 85.25, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 24, 41, 1, 0, 58.54, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 46, 55, 3, 1, 83.64, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 79;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 70;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 8.0, 66, 4, 8.33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.0, 22, 1, 3.24;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 7.5, 64, 3, 8.65;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 6.6, 42, 1, 6.42;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'England vs New Zealand, ODI #13', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2026-01-11',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    163, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 0, 2, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 0, 2, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 38, 58, 2, 1, 65.52, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 27, 31, 2, 0, 87.1, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 76, 99, 3, 1, 76.77, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 56, 79, 2, 2, 70.89, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 38;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 65;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 132;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 8.8, 77, 2, 8.86;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 4.9, 28, 1, 5.87;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 7.5, 53, 1, 7.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 5.5, 46, 0, 8.49;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.3, 38, 0, 6.14;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs India, T20I #14', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2024-07-27',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='India'),
    160, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 9, 14, 0, 0, 64.29, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 5, 15, 1, 0, 33.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 20, 20, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 71, 74, 2, 2, 95.95, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 41, 41, 3, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 5, 10, 0, 0, 50.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 31, 38, 0, 0, 81.58, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 14;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 112;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 46;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 36;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 7.7, 70, 1, 9.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.7, 55, 2, 7.21;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.8, 51, 2, 7.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4.7, 15, 0, 3.29;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 10.0, 37, 0, 3.75;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 1, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs South Africa, Test #15', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2024-06-27',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 12, 17, 1, 0, 70.59, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 0, 1, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 71, 71, 0, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 0, 6, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 0, 9, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 36, 60, 0, 1, 60.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 74, 74, 4, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 70, 70, 1, 2, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 12;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 71;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 71;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 110;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 144;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 5.0, 16, 2, 3.34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 7.2, 56, 1, 7.85;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 8.7, 55, 0, 6.34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.0, 64, 0, 9.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.7, 75, 1, 8.64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 6.7, 62, 0, 9.27;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs India, ODI #16', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2026-01-01',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 63, 79, 0, 2, 79.75, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 3, 7, 1, 0, 42.86, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 0, 8, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 23, 24, 1, 0, 95.83, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 51, 51, 0, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 44, 63, 2, 0, 69.84, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 2, 9, 0, 0, 22.22, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 12, 18, 0, 0, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 58, 71, 2, 2, 81.69, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 3, 14, 0, 0, 21.43, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 66;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 3;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 23;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 74;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 46;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 14;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 61;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 5.6, 44, 4, 7.96;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.1, 25, 0, 4.18;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 7.9, 27, 2, 3.45;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.8, 35, 1, 3.6;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.3, 37, 0, 5.95;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5.9, 30, 4, 5.11;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs South Africa, ODI #17', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2021-06-01',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 45, 68, 3, 1, 66.18, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 5, 8, 0, 0, 62.5, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 52, 52, 0, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 43, 66, 2, 0, 65.15, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 53, 79, 0, 1, 67.09, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 95;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 96;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.2, 62, 1, 6.74;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 8.3, 47, 0, 5.72;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.1, 20, 3, 5.11;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 7.7, 64, 3, 8.41;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 4.5, 38, 0, 8.49;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs India, T20I #18', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2021-03-05',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='India'),
    3, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 42, 54, 1, 1, 77.78, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 45, 64, 3, 1, 70.31, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 22, 24, 1, 0, 91.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 21, 23, 1, 0, 91.3, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 76, 76, 4, 3, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 48, 58, 3, 0, 82.76, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 17, 17, 1, 0, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 87;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 43;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 97;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 124;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 65;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 5.0, 23, 1, 4.61;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 6.6, 42, 0, 6.4;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.2, 30, 1, 4.84;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.0, 41, 2, 6.89;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 7.9, 27, 0, 3.43;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, ODI #19', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2026-05-11',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    157, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 34, 46, 0, 0, 73.91, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 10, 13, 0, 0, 76.92, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 42, 51, 1, 0, 82.35, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 38, 61, 0, 1, 62.3, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 22, 37, 1, 0, 59.46, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 52, 77, 3, 0, 67.53, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 0, 4, 1, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 44;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 80;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 60;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 74;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 52;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.7, 39, 0, 4.52;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 9.8, 79, 3, 8.1;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 5.2, 38, 1, 7.41;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.6, 52, 2, 8.0;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 7.0, 40, 0, 5.72;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs India, Test #20', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2020-10-18',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 78, 117, 0, 3, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 61, 74, 3, 0, 82.43, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 88, 134, 2, 1, 65.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 42, 72, 1, 1, 58.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 42, 42, 3, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 32, 32, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 39, 39, 0, 0, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 139;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 130;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 84;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 74;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 71;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 5.7, 17, 1, 3.01;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.4, 31, 2, 4.22;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 7.1, 37, 4, 5.34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 7.3, 59, 1, 8.11;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 4.1, 35, 0, 8.68;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs England, Test #21', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2022-12-14',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='England'),
    180, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 5, 9, 0, 0, 55.56, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 45, 73, 2, 1, 61.64, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 74, 92, 0, 2, 80.43, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 4, 11, 1, 0, 36.36, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 66, 79, 5, 1, 83.54, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 0, 8, 1, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 78;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 66;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 8.4, 29, 2, 3.51;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 8.9, 58, 1, 6.55;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 4.5, 32, 1, 7.3;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 7.6, 43, 2, 5.77;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 6.1, 20, 3, 3.28;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, Test #22', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2025-10-24',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    37, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 76, 112, 2, 3, 67.86, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 46, 56, 2, 1, 82.14, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 34, 50, 1, 1, 68.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 20, 20, 1, 0, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 94, 94, 7, 1, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 19, 23, 0, 0, 82.61, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 86, 137, 1, 2, 62.77, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 122;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 54;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 114;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 113;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 105;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.3, 54, 0, 6.57;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 5.8, 23, 2, 4.02;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 8.2, 33, 1, 4.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 5.3, 49, 2, 9.4;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5.4, 33, 1, 6.21;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 0, 1, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs South Africa, ODI #23', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2023-08-05',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    86, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 2, 10, 0, 0, 20.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 38, 58, 0, 0, 65.52, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 62, 64, 2, 0, 96.88, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 81, 111, 2, 1, 72.97, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 23, 39, 0, 0, 58.97, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 40;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 143;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 104;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.3, 57, 3, 6.93;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.4, 61, 0, 8.36;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.3, 30, 1, 7.17;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 7.9, 63, 1, 7.99;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 7.8, 48, 2, 6.24;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs Pakistan, Test #24', 'Test',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2022-10-25',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    6, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 24, 25, 2, 0, 96.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 12, 13, 0, 0, 92.31, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 36, 60, 1, 0, 60.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 68, 68, 3, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 15, 30, 0, 0, 50.0, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 36;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 83;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.0, 64, 0, 9.28;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 6.1, 20, 1, 3.33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 9.3, 67, 1, 7.25;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 7.2, 61, 1, 8.51;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 9.3, 71, 2, 7.73;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs England, T20I #25', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2025-11-07',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    29, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 38, 61, 1, 1, 62.3, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 10, 10, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 63, 63, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 74, 97, 4, 1, 76.29, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 3, 11, 0, 0, 27.27, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 30, 30, 2, 1, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 137;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 77;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 8.4, 62, 0, 7.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.8, 63, 2, 9.29;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 8.7, 58, 2, 6.75;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 7.5, 30, 2, 4.11;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 7.7, 65, 0, 8.47;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs South Africa, T20I #26', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2024-04-15',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    137, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 60, 65, 3, 2, 92.31, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 31, 36, 2, 1, 86.11, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 32, 33, 1, 0, 96.97, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 63, 79, 2, 2, 79.75, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 37, 38, 3, 1, 97.37, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 12, 21, 1, 0, 57.14, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 26, 33, 2, 1, 78.79, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 9, 18, 1, 0, 50.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 63;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 95;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 100;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 38;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 35;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 8.4, 38, 0, 4.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 9.4, 42, 0, 4.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 4.6, 23, 1, 5.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 8.1, 31, 4, 3.89;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 9.9, 39, 2, 4.03;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 9.3, 56, 2, 6.09;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 1, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs Australia, Test #27', 'Test',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2019-05-29',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    3, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 64, 64, 2, 1, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 33, 47, 0, 1, 70.21, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 40, 59, 1, 0, 67.8, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 11, 25, 0, 0, 44.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 15, 22, 0, 0, 68.18, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 12, 13, 1, 0, 92.31, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 56, 66, 2, 1, 84.85, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 33, 45, 2, 1, 73.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 43, 48, 2, 0, 89.58, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 36, 61, 1, 0, 59.02, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 97;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 73;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 51;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 26;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 68;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 89;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 76;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 79;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.9, 41, 4, 5.96;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.2, 46, 3, 7.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.5, 69, 3, 8.21;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 8.6, 63, 1, 7.42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 8.7, 55, 1, 6.42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 6.2, 55, 0, 8.96;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs South Africa, T20I #28', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2023-12-30',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    3, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 2, 7, 0, 0, 28.57, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 19, 19, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 22, 22, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 2, 4, 1, 0, 50.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 0, 7, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 21;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 24;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 2;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 6.1, 25, 1, 4.16;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.2, 55, 0, 7.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.0, 12, 0, 3.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.0, 52, 1, 6.54;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 8.9, 41, 1, 4.61;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs Pakistan, Test #29', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2025-08-29',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 65, 73, 4, 0, 89.04, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 34, 58, 2, 1, 58.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 18, 31, 0, 0, 58.06, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 62, 71, 0, 2, 87.32, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 29, 46, 2, 1, 63.04, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 53, 74, 4, 1, 71.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 38, 45, 3, 0, 84.44, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 99;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 52;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 80;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 91;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 6.8, 57, 1, 8.52;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 8.2, 67, 3, 8.24;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 7.4, 68, 1, 9.29;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 4.8, 21, 0, 4.58;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.9, 71, 3, 8.99;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs Pakistan, ODI #30', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2021-05-05',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 44, 78, 1, 0, 56.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 29, 32, 1, 1, 90.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 19, 27, 1, 0, 70.37, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 14, 24, 0, 0, 58.33, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 73;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 4.3, 37, 2, 8.62;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 4.1, 27, 1, 6.6;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 8.3, 40, 0, 4.92;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 5.4, 36, 0, 6.7;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs New Zealand, Test #31', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2025-01-29',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    24, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 0, 3, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 57, 69, 4, 1, 82.61, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 62, 67, 4, 2, 92.54, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 35, 56, 2, 1, 62.5, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 57;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 97;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 9.5, 35, 0, 3.7;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 4.9, 20, 1, 4.25;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 8.9, 42, 1, 4.74;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.2, 34, 1, 5.64;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs Pakistan, Test #32', 'Test',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2019-12-05',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    6, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 38, 60, 3, 1, 63.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 85, 85, 0, 1, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 6, 14, 0, 0, 42.86, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 90, 90, 5, 3, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 79, 115, 5, 2, 68.7, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 89, 99, 5, 3, 89.9, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 15, 29, 1, 0, 51.72, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 123;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 96;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 169;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 104;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.6, 55, 2, 5.81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 8.0, 28, 2, 3.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.8, 67, 0, 7.64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 4.9, 37, 2, 7.63;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 8.4, 42, 0, 5.06;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs India, Test #33', 'Test',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2022-12-20',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 63, 69, 5, 2, 91.3, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 64, 64, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 27, 28, 0, 0, 96.43, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 6, 9, 0, 0, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 45, 45, 1, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 0, 6, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 61, 97, 1, 1, 62.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 47, 53, 2, 1, 88.68, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 127;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 51;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 45;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 61;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 108;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.8, 72, 2, 9.29;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 6.0, 28, 2, 4.82;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 6.2, 56, 0, 9.06;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 10.0, 41, 2, 4.17;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4.2, 32, 4, 7.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5.3, 43, 3, 8.18;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs India, T20I #34', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2024-05-16',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 26, 43, 2, 0, 60.47, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 32, 37, 0, 1, 86.49, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 68, 74, 0, 0, 91.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 39, 56, 1, 1, 69.64, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 72, 90, 5, 2, 80.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 60, 60, 0, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 31, 38, 0, 1, 81.58, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 64, 72, 2, 0, 88.89, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 58;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 100;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 111;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 132;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 91;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 95;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.7, 40, 2, 8.52;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.1, 32, 4, 4.07;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 5.5, 22, 0, 4.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 7.4, 68, 0, 9.23;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.4, 26, 2, 4.2;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 6.6, 21, 2, 3.19;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs India, Test #35', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2023-02-07',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    122, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 55, 79, 4, 2, 69.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 12, 15, 1, 0, 80.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 48, 69, 4, 0, 69.57, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 24, 25, 2, 0, 96.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 49, 55, 4, 1, 89.09, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 1, 4, 0, 0, 25.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 34, 37, 2, 0, 91.89, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 67;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 72;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 73;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 35;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.7, 59, 0, 6.15;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.3, 41, 2, 6.65;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.5, 40, 2, 6.2;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.7, 27, 1, 4.09;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.8, 38, 0, 4.43;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs England, ODI #36', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2025-01-29',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 69, 99, 0, 1, 69.7, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 60, 90, 3, 0, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 35, 49, 2, 1, 71.43, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 77, 77, 6, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 4, 7, 1, 0, 57.14, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 18, 25, 0, 0, 72.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 44, 73, 1, 0, 60.27, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 0, 4, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 8, 10, 0, 0, 80.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 129;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 95;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 112;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 81;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 62;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 44;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 8;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 5.7, 51, 1, 9.09;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 9.7, 49, 0, 5.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.6, 66, 2, 7.76;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 6.8, 49, 1, 7.32;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 4.4, 28, 0, 6.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 6.6, 28, 0, 4.38;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs South Africa, Test #37', 'Test',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2020-10-09',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 6, 12, 1, 0, 50.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 39, 41, 2, 0, 95.12, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 24, 34, 1, 0, 70.59, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 60, 60, 4, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 32, 32, 0, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 14, 14, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 34, 39, 0, 0, 87.18, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 0, 6, 0, 0, 0.0, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 45;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 63;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 84;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 92;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 7.7, 45, 0, 5.88;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 9.4, 36, 0, 3.91;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.4, 44, 1, 5.28;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 8.7, 40, 2, 4.61;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 5.5, 38, 2, 6.91;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 5.7, 51, 0, 9.12;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Australia vs South Africa, Test #38', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2021-09-14',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    140, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 18, 30, 1, 0, 60.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 14, 23, 0, 0, 60.87, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 0, 1, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 6, 9, 0, 0, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 31, 31, 0, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 0, 2, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 0, 1, 0, 0, 0.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 57, 57, 0, 0, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 32;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 14;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 6;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 37;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 57;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 8.2, 33, 4, 4.06;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 7.1, 57, 2, 8.09;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5.0, 19, 2, 3.83;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 5.6, 49, 2, 8.76;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 4.2, 34, 0, 8.25;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 4.4, 33, 1, 7.63;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs India, T20I #39', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2024-09-15',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    8, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 54, 67, 1, 0, 80.6, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 51, 84, 1, 1, 60.71, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 7, 16, 1, 0, 43.75, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 59, 59, 4, 0, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 57, 57, 2, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 29, 35, 1, 0, 82.86, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 30, 44, 0, 0, 68.18, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 105;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 66;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 116;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 86;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 59;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.6, 30, 1, 3.16;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.8, 58, 0, 7.51;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.0, 47, 1, 7.93;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 8.4, 42, 0, 5.0;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 9.9, 56, 4, 5.73;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs India, Test #40', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2024-09-01',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    2, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 25, 30, 1, 1, 83.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 20, 20, 0, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 19, 24, 1, 0, 79.17, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 24, 28, 1, 0, 85.71, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 38, 59, 0, 0, 64.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 23, 24, 0, 0, 95.83, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 52, 77, 0, 1, 67.53, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 45;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 43;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 62;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 61;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 75;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 7.3, 48, 0, 6.58;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 4.6, 37, 0, 8.16;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 4.4, 35, 0, 8.08;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 5.2, 29, 2, 5.6;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 9.6, 34, 1, 3.55;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'England vs India, ODI #41', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2019-07-27',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 38, 46, 1, 1, 82.61, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 39, 59, 1, 1, 66.1, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 50, 82, 0, 0, 60.98, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 42, 71, 1, 0, 59.15, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 44, 67, 3, 1, 65.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 11, 11, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 23, 37, 0, 0, 62.16, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 42, 68, 1, 0, 61.76, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 0, 1, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 77;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 89;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 92;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 55;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 34;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 65;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 9.0, 76, 0, 8.49;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 7.6, 62, 2, 8.24;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 9.5, 30, 2, 3.18;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.7, 64, 1, 6.66;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 5.1, 48, 3, 9.42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 7.0, 35, 1, 5.01;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'England vs Australia, Test #42', 'Test',
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2019-03-31',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    33, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 0, 2, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 74, 123, 6, 2, 60.16, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 22, 44, 1, 0, 50.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 19, 34, 1, 0, 55.88, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 23, 42, 0, 0, 54.76, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 0, 10, 0, 0, 0.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 58, 59, 1, 2, 98.31, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 63, 63, 3, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 32, 32, 2, 0, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 74;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 96;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 41;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 23;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 58;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 121;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 95;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 6.6, 37, 0, 5.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 6.5, 56, 1, 8.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 6.3, 52, 2, 8.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 7.5, 59, 0, 7.93;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.7, 54, 0, 8.19;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 4.1, 19, 0, 4.7;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 2, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 0, 1, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs India, T20I #43', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2020-11-06',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    18, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 41, 41, 3, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 28, 38, 1, 0, 73.68, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 42, 42, 2, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 47, 47, 3, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 34, 43, 2, 1, 79.07, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 16, 29, 0, 0, 55.17, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 27, 34, 0, 1, 79.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 54, 54, 4, 1, 100.0, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 69;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 81;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 43;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.5, 49, 3, 6.6;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.9, 50, 1, 5.72;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 9.2, 56, 3, 6.09;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 6.9, 24, 3, 3.51;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 8.3, 51, 3, 6.26;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 8.8, 65, 2, 7.4;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs South Africa, T20I #44', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2020-08-28',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    2, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 63, 84, 2, 1, 75.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 35, 56, 2, 1, 62.5, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 30, 35, 2, 0, 85.71, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 21, 29, 1, 0, 72.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 27, 44, 2, 1, 61.36, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 98;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 51;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 48;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 5.7, 22, 2, 3.94;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 8.2, 26, 3, 3.25;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 6.0, 27, 2, 4.54;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 9.5, 83, 0, 8.83;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 8.9, 44, 0, 4.97;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs India, ODI #45', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2021-05-15',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='India'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 17, 25, 1, 0, 68.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 30, 45, 0, 0, 66.67, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 55, 58, 0, 1, 94.83, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 0, 8, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 33, 44, 2, 1, 75.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 60, 92, 5, 2, 65.22, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 39, 61, 1, 0, 63.93, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 47;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 55;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 33;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 93;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 99;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 5.6, 31, 0, 5.66;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 8.7, 69, 0, 7.99;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 9.5, 68, 2, 7.21;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4.1, 19, 3, 4.64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5.8, 53, 2, 9.29;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs New Zealand, ODI #46', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2025-04-18',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    2, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 33, 38, 2, 1, 86.84, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 29, 48, 0, 0, 60.42, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 71, 71, 4, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 15, 24, 1, 0, 62.5, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 0, 10, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 37, 58, 2, 0, 63.79, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 62, 95, 2, 0, 65.26, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 62;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 100;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 86;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 15;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 99;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 8.4, 64, 1, 7.71;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 9.5, 87, 3, 9.16;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 7.9, 35, 0, 4.44;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.2, 52, 3, 5.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.2, 42, 1, 6.81;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs South Africa, ODI #47', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2023-08-20',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    40, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 4, 14, 0, 0, 28.57, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 49, 49, 3, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 47, 47, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 63, 63, 1, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 8, 10, 0, 0, 80.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 53;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 110;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 71;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 9.7, 85, 2, 8.8;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 7.2, 22, 0, 3.12;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 8.4, 37, 3, 4.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 5.9, 21, 1, 3.67;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 5.8, 19, 0, 3.42;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 1, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs England, Test #48', 'Test',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2023-07-11',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    62, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 43, 68, 1, 0, 63.24, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 27, 45, 2, 0, 60.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 26, 26, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 52, 52, 3, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 50, 67, 2, 1, 74.63, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 21, 29, 1, 0, 72.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 15, 23, 0, 0, 65.22, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 70;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 53;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 102;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 71;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 36;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.7, 62, 3, 8.06;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 9.8, 52, 1, 5.33;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 5.0, 32, 3, 6.56;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 8.1, 49, 0, 6.12;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 4.1, 14, 0, 3.58;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 7.4, 45, 4, 6.21;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs India, Test #49', 'Test',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2019-06-11',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='India'),
    6, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 66, 66, 5, 2, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 55, 64, 4, 1, 85.94, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 70, 70, 3, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 57, 67, 3, 2, 85.07, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 38, 54, 0, 1, 70.37, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 43, 58, 3, 0, 74.14, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 38, 59, 3, 1, 64.41, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 0, 1, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 121;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 125;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 95;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 81;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 81;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 38;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.1, 35, 1, 8.64;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.5, 65, 0, 7.7;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 9.7, 84, 1, 8.68;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 8.1, 56, 1, 7.02;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 8.4, 51, 2, 6.13;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 7.8, 30, 3, 3.97;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'England vs Australia, ODI #50', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2019-07-26',
    (SELECT team_id FROM teams WHERE team_name='England'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 0, 8, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 43, 50, 0, 1, 86.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 31, 34, 2, 1, 91.18, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 31, 45, 1, 1, 68.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 51, 60, 4, 1, 85.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 0, 8, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 36, 57, 2, 0, 63.16, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 54, 54, 3, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 36, 56, 3, 0, 64.29, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 43;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 74;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 62;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 51;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 36;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 90;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 90;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 4.6, 26, 4, 5.69;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 9.0, 61, 2, 6.83;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 6.7, 48, 4, 7.28;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 4.8, 29, 1, 6.24;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4.3, 39, 3, 9.08;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 6.9, 43, 4, 6.3;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs New Zealand, Test #51', 'Test',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2022-01-25',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    5, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 43, 45, 2, 1, 95.56, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 64, 66, 5, 1, 96.97, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 18, 30, 0, 0, 60.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 34, 48, 2, 1, 70.83, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 0, 1, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 107;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 82;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 4.3, 14, 0, 3.37;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.7, 81, 2, 9.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 4.9, 16, 2, 3.4;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 5.2, 33, 1, 6.52;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.7, 46, 2, 7.0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs South Africa, ODI #52', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2022-07-04',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    69, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 58, 83, 4, 2, 69.88, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 0, 4, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 25, 30, 0, 1, 83.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 17, 21, 0, 0, 80.95, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 31, 44, 0, 0, 70.45, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 54, 76, 2, 1, 71.05, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 22, 38, 0, 0, 57.89, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 28, 42, 1, 1, 66.67, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 58;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 25;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 42;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 76;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 50;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 5.3, 23, 1, 4.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 6.2, 27, 2, 4.42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 7.2, 68, 3, 9.48;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 9.9, 30, 2, 3.06;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 6.7, 59, 2, 8.88;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 7.7, 71, 2, 9.23;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs South Africa, Test #53', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2022-04-29',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    9, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 63, 75, 5, 0, 84.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 86, 112, 6, 0, 76.79, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 56, 83, 0, 2, 67.47, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 0, 6, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 40, 40, 2, 1, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 149;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 56;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 40;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 7.8, 45, 0, 5.81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 8.0, 51, 2, 6.48;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.7, 60, 1, 7.91;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 8.2, 28, 4, 3.47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 4.6, 37, 1, 8.11;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs England, Test #54', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2022-05-05',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='England'),
    146, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 49, 49, 4, 1, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 52, 77, 1, 1, 67.53, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 25, 39, 0, 0, 64.1, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 40, 44, 0, 1, 90.91, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 17, 17, 1, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 0, 4, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 101;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 65;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 57;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 17;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.4, 47, 1, 5.07;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.7, 38, 1, 4.99;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 7.4, 39, 1, 5.37;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 6.6, 19, 0, 3.03;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 5.3, 41, 1, 7.81;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'), 1, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs India, Test #55', 'Test',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT venue_id FROM venues WHERE venue_name='Lord''s'),
    '2025-01-15',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    2, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 2, 3, 1, 0, 66.67, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 2, 11, 0, 0, 18.18, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 22, 43, 1, 0, 51.16, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 6, 10, 0, 0, 60.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 30, 35, 2, 0, 85.71, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 8, 15, 0, 0, 53.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 34, 34, 2, 1, 100.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 4;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 28;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 36;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 38;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 42;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 9.5, 82, 0, 8.73;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.9, 28, 4, 3.67;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 7.8, 37, 2, 4.78;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 7.5, 50, 1, 6.71;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 6.3, 42, 3, 6.82;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'), 2, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'South Africa vs New Zealand, T20I #56', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Melbourne Cricket Ground'),
    '2020-07-23',
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    63, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 35, 37, 2, 0, 94.59, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 47, 48, 3, 1, 97.92, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 1, 5, 0, 0, 20.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 12, 19, 0, 0, 63.16, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 31, 58, 2, 0, 53.45, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 82;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 48;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 43;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 8.4, 70, 4, 8.34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 5.3, 36, 1, 6.94;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 6.9, 30, 1, 4.43;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 4.9, 33, 2, 6.79;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.7, 48, 0, 6.32;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs South Africa, T20I #57', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='South Africa'),
    (SELECT venue_id FROM venues WHERE venue_name='Narendra Modi Stadium'),
    '2020-01-30',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bat',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    1, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 47, 56, 0, 1, 83.93, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 26, 34, 1, 1, 76.47, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 1, 37, 62, 0, 1, 59.68, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 13, 24, 1, 0, 54.17, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 3, 34, 46, 2, 0, 73.91, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 73;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 2, 50;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    2, 3, 47;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 6.3, 27, 3, 4.34;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 6.5, 23, 1, 3.69;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kagiso Rabada'),
    1, 7.5, 35, 1, 4.7;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'),
    1, 7.4, 51, 4, 6.98;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'),
    1, 6.4, 27, 1, 4.32;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Aiden Markram'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Quinton de Kock'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'Pakistan vs Australia, Test #58', 'Test',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    (SELECT venue_id FROM venues WHERE venue_name='Basin Reserve'),
    '2021-07-30',
    (SELECT team_id FROM teams WHERE team_name='Pakistan'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='Australia'),
    30, 'runs', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 1, 42, 53, 1, 1, 79.25, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 0, 2, 0, 0, 0.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    1, 1, 23, 23, 0, 0, 100.0, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 35, 46, 1, 0, 76.09, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 3, 47, 55, 2, 0, 85.45, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 4, 0, 9, 0, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 5, 8, 14, 1, 0, 57.14, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 2, 42;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Steve Smith'),
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    1, 2, 58;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Pat Cummins'),
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    2, 3, 82;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    3, 4, 47;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='David Warner'),
    (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    4, 5, 8;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'),
    1, 6.4, 43, 1, 6.81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Shaheen Afridi'),
    1, 8.4, 28, 0, 3.45;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'),
    1, 5.7, 47, 3, 8.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='David Warner'),
    1, 6.1, 56, 0, 9.26;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Alex Carey'),
    1, 7.6, 32, 4, 4.26;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Glenn Maxwell'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Babar Azam'), 1, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Steve Smith'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'New Zealand vs England, T20I #59', 'T20I',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT team_id FROM teams WHERE team_name='England'),
    (SELECT venue_id FROM venues WHERE venue_name='The Wanderers Stadium'),
    '2021-10-21',
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='England'),
    8, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 60, 101, 5, 1, 59.41, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 50, 53, 1, 2, 94.34, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'),
    1, 1, 10, 21, 1, 0, 47.62, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 30, 37, 0, 0, 81.08, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 3, 52, 62, 2, 0, 83.87, 0;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4, 9, 14, 0, 0, 64.29, 0;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 110;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Joe Root'),
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 2, 40;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='James Anderson'),
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    2, 3, 82;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    3, 4, 61;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 5.2, 22, 0, 4.32;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 7.7, 30, 0, 4.01;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'),
    1, 9.5, 70, 2, 7.39;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'),
    1, 7.7, 61, 1, 7.97;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jos Buttler'),
    1, 4.3, 26, 2, 6.13;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='James Anderson'), 0, 1, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ben Stokes'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Joe Root'), 0, 0, 0;
INSERT INTO matches (series_id, match_description, match_format, team1_id, team2_id, venue_id,
    match_date, toss_winner_id, toss_decision, winning_team_id, victory_margin, victory_type, match_status)
SELECT (SELECT series_id FROM series ORDER BY RAND() LIMIT 1),
    'India vs New Zealand, ODI #60', 'ODI',
    (SELECT team_id FROM teams WHERE team_name='India'),
    (SELECT team_id FROM teams WHERE team_name='New Zealand'),
    (SELECT venue_id FROM venues WHERE venue_name='Eden Gardens'),
    '2025-01-23',
    (SELECT team_id FROM teams WHERE team_name='India'),
    'bowl',
    (SELECT team_id FROM teams WHERE team_name='India'),
    7, 'wickets', 'Completed';
SET @current_match_id = LAST_INSERT_ID();
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    1, 1, 0, 9, 1, 0, 0.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 49, 65, 2, 1, 75.38, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 3, 33, 35, 1, 1, 94.29, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 4, 14, 24, 1, 0, 58.33, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5, 32, 32, 2, 0, 100.0, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 1, 23, 34, 0, 0, 67.65, 1;
INSERT INTO batting_stats (match_id, player_id, innings_number, batting_position,
    runs_scored, balls_faced, fours, sixes, strike_rate, is_out)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 0, 8, 0, 0, 0.0, 1;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Rohit Sharma'),
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    1, 2, 49;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Virat Kohli'),
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    2, 3, 82;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    3, 4, 47;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    4, 5, 46;
INSERT INTO partnerships (match_id, innings_number, player1_id, player2_id, position1, position2, partnership_runs)
SELECT @current_match_id,
    1,
    (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 2, 23;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'),
    1, 4.8, 42, 2, 8.81;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Ravindra Jadeja'),
    1, 7.2, 36, 1, 5.05;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Rishabh Pant'),
    1, 5.5, 47, 0, 8.58;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'),
    1, 4.6, 18, 0, 4.06;
INSERT INTO bowling_stats (match_id, player_id, innings_number, overs_bowled, runs_conceded, wickets_taken, economy_rate)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'),
    1, 5.5, 46, 0, 8.45;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Kane Williamson'), 0, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Jasprit Bumrah'), 2, 0, 0;
INSERT INTO fielding_stats (match_id, player_id, catches, stumpings, run_outs)
SELECT @current_match_id, (SELECT player_id FROM players WHERE full_name='Trent Boult'), 0, 0, 0;
