-- ============================================================
--  Cricbuzz LiveStats — MySQL Schema
--  Run this once in MySQL Workbench (or `mysql < schema.sql`)
--  to create the database and all tables.
-- ============================================================

CREATE DATABASE IF NOT EXISTS cricbuzz_livestats
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE cricbuzz_livestats;

-- ------------------------------------------------------------
-- 1. TEAMS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS teams (
    team_id       INT AUTO_INCREMENT PRIMARY KEY,
    team_name     VARCHAR(100) NOT NULL UNIQUE,
    country       VARCHAR(100) NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 2. VENUES
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS venues (
    venue_id      INT AUTO_INCREMENT PRIMARY KEY,
    venue_name    VARCHAR(150) NOT NULL,
    city          VARCHAR(100),
    country       VARCHAR(100) NOT NULL,
    capacity      INT DEFAULT 0,
    UNIQUE KEY uq_venue (venue_name, city)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 3. PLAYERS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS players (
    player_id      INT AUTO_INCREMENT PRIMARY KEY,
    full_name      VARCHAR(150) NOT NULL,
    country        VARCHAR(100) NOT NULL,
    playing_role   ENUM('Batsman','Bowler','All-rounder','Wicket-keeper') NOT NULL,
    batting_style  VARCHAR(50),
    bowling_style  VARCHAR(50),
    date_of_birth  DATE,
    team_id        INT,
    CONSTRAINT fk_player_team FOREIGN KEY (team_id) REFERENCES teams(team_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    INDEX idx_player_country (country),
    INDEX idx_player_role (playing_role)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 4. SERIES
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS series (
    series_id       INT AUTO_INCREMENT PRIMARY KEY,
    series_name     VARCHAR(200) NOT NULL,
    host_country    VARCHAR(100),
    match_type      ENUM('Test','ODI','T20I') NOT NULL,
    start_date      DATE,
    total_matches   INT DEFAULT 0,
    INDEX idx_series_start (start_date)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 5. MATCHES
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS matches (
    match_id          INT AUTO_INCREMENT PRIMARY KEY,
    series_id         INT,
    match_description VARCHAR(255),
    match_format      ENUM('Test','ODI','T20I') NOT NULL,
    team1_id          INT NOT NULL,
    team2_id          INT NOT NULL,
    venue_id          INT,
    match_date        DATE NOT NULL,
    toss_winner_id    INT,
    toss_decision     ENUM('bat','bowl'),
    winning_team_id   INT,
    victory_margin    INT,
    victory_type      ENUM('runs','wickets'),
    match_status      VARCHAR(50) DEFAULT 'Completed',
    CONSTRAINT fk_match_series  FOREIGN KEY (series_id)       REFERENCES series(series_id)  ON DELETE SET NULL,
    CONSTRAINT fk_match_team1   FOREIGN KEY (team1_id)        REFERENCES teams(team_id),
    CONSTRAINT fk_match_team2   FOREIGN KEY (team2_id)        REFERENCES teams(team_id),
    CONSTRAINT fk_match_venue   FOREIGN KEY (venue_id)        REFERENCES venues(venue_id) ON DELETE SET NULL,
    CONSTRAINT fk_match_toss    FOREIGN KEY (toss_winner_id)  REFERENCES teams(team_id),
    CONSTRAINT fk_match_winner  FOREIGN KEY (winning_team_id) REFERENCES teams(team_id),
    INDEX idx_match_date (match_date),
    INDEX idx_match_format (match_format)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 6. BATTING_STATS  (one row per player per innings per match)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS batting_stats (
    batting_stat_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id          INT NOT NULL,
    player_id         INT NOT NULL,
    innings_number    TINYINT NOT NULL DEFAULT 1,
    batting_position  TINYINT,
    runs_scored       INT DEFAULT 0,
    balls_faced       INT DEFAULT 0,
    fours             INT DEFAULT 0,
    sixes             INT DEFAULT 0,
    strike_rate       DECIMAL(6,2) DEFAULT 0.00,
    is_out            BOOLEAN DEFAULT TRUE,
    dismissal_type    VARCHAR(50),
    CONSTRAINT fk_bat_match  FOREIGN KEY (match_id)  REFERENCES matches(match_id)  ON DELETE CASCADE,
    CONSTRAINT fk_bat_player FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    INDEX idx_bat_player (player_id),
    INDEX idx_bat_match (match_id)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 7. BOWLING_STATS  (one row per player per innings per match)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS bowling_stats (
    bowling_stat_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id          INT NOT NULL,
    player_id         INT NOT NULL,
    innings_number    TINYINT NOT NULL DEFAULT 1,
    overs_bowled      DECIMAL(4,1) DEFAULT 0.0,
    runs_conceded     INT DEFAULT 0,
    wickets_taken     INT DEFAULT 0,
    economy_rate      DECIMAL(5,2) DEFAULT 0.00,
    CONSTRAINT fk_bowl_match  FOREIGN KEY (match_id)  REFERENCES matches(match_id)  ON DELETE CASCADE,
    CONSTRAINT fk_bowl_player FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    INDEX idx_bowl_player (player_id),
    INDEX idx_bowl_match (match_id)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 8. FIELDING_STATS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS fielding_stats (
    fielding_stat_id  BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id          INT NOT NULL,
    player_id         INT NOT NULL,
    catches           INT DEFAULT 0,
    stumpings         INT DEFAULT 0,
    run_outs          INT DEFAULT 0,
    CONSTRAINT fk_field_match  FOREIGN KEY (match_id)  REFERENCES matches(match_id)  ON DELETE CASCADE,
    CONSTRAINT fk_field_player FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    INDEX idx_field_player (player_id)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- 9. PARTNERSHIPS  (consecutive-position batting pairs, per innings)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS partnerships (
    partnership_id     BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id           INT NOT NULL,
    innings_number     TINYINT NOT NULL DEFAULT 1,
    player1_id         INT NOT NULL,
    player2_id         INT NOT NULL,
    position1          TINYINT NOT NULL,
    position2          TINYINT NOT NULL,
    partnership_runs   INT DEFAULT 0,
    CONSTRAINT fk_part_match FOREIGN KEY (match_id)  REFERENCES matches(match_id) ON DELETE CASCADE,
    CONSTRAINT fk_part_p1    FOREIGN KEY (player1_id) REFERENCES players(player_id),
    CONSTRAINT fk_part_p2    FOREIGN KEY (player2_id) REFERENCES players(player_id),
    INDEX idx_part_players (player1_id, player2_id)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  Helpful VIEW: career-level aggregated batting summary
--  (keeps heavy aggregation logic reusable for the app)
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW player_batting_career AS
SELECT
    p.player_id,
    p.full_name,
    m.match_format,
    SUM(b.runs_scored)                         AS total_runs,
    COUNT(DISTINCT b.match_id)                 AS matches_played,
    ROUND(SUM(b.runs_scored) /
          NULLIF(SUM(CASE WHEN b.is_out THEN 1 ELSE 0 END), 0), 2) AS batting_average,
    SUM(CASE WHEN b.runs_scored >= 100 THEN 1 ELSE 0 END)          AS centuries,
    MAX(b.runs_scored)                                             AS highest_score
FROM batting_stats b
JOIN players p ON p.player_id = b.player_id
JOIN matches m ON m.match_id = b.match_id
GROUP BY p.player_id, p.full_name, m.match_format;

CREATE OR REPLACE VIEW player_bowling_career AS
SELECT
    p.player_id,
    p.full_name,
    m.match_format,
    SUM(bw.wickets_taken)                                          AS total_wickets,
    ROUND(SUM(bw.runs_conceded) / NULLIF(SUM(bw.overs_bowled), 0), 2) AS economy_rate,
    ROUND(SUM(bw.runs_conceded) / NULLIF(SUM(bw.wickets_taken), 0), 2) AS bowling_average
FROM bowling_stats bw
JOIN players p ON p.player_id = bw.player_id
JOIN matches m ON m.match_id = bw.match_id
GROUP BY p.player_id, p.full_name, m.match_format;
