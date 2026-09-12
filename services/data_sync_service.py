"""
services/data_sync_service.py
-------------------------------
Business logic layer: pulls data from the Cricbuzz API (api/cricbuzz_api.py)
and normalizes/inserts it into MySQL (database/db_connection.py).

Keeping this separate from the Streamlit pages means the *same* sync
logic could later be triggered by a cron job / Airflow / a CLI script,
not just a button click in the UI.
"""

from datetime import datetime

from api import cricbuzz_api
from database.db_connection import execute_write, run_query
from utils.helpers import safe_get


def sync_teams_from_match(match_json: dict) -> None:
    """Ensures both teams in a match JSON exist in the `teams` table."""
    for team_key in ("team1", "team2"):
        team_name = safe_get(match_json, team_key, "teamName")
        if not team_name:
            continue
        existing = run_query(
            "SELECT team_id FROM teams WHERE team_name = :name",
            {"name": team_name},
        )
        if existing.empty:
            execute_write(
                "INSERT INTO teams (team_name, country) VALUES (:name, :country)",
                {"name": team_name, "country": team_name},
            )


def sync_live_matches() -> int:
    """
    Fetches live matches from the API and upserts basic match rows.
    Returns the number of matches processed (0 if API/DB failed).
    """
    data = cricbuzz_api.get_live_matches()
    type_matches = safe_get(data, "typeMatches", default=[])
    processed = 0

    for type_match in type_matches:
        for series_match in safe_get(type_match, "seriesMatches", default=[]):
            series_wrapper = safe_get(series_match, "seriesAdWrapper", default={})
            for match in safe_get(series_wrapper, "matches", default=[]):
                match_info = safe_get(match, "matchInfo", default={})
                sync_teams_from_match(match_info)

                description = safe_get(match_info, "matchDesc", default="")
                fmt = safe_get(match_info, "matchFormat", default="ODI")
                status = safe_get(match_info, "status", default="")

                execute_write(
                    """
                    INSERT INTO matches (match_description, match_format, team1_id, team2_id, match_date, match_status)
                    SELECT :desc, :fmt,
                           (SELECT team_id FROM teams WHERE team_name = :t1 LIMIT 1),
                           (SELECT team_id FROM teams WHERE team_name = :t2 LIMIT 1),
                           :mdate, :status
                    """,
                    {
                        "desc": description,
                        "fmt": fmt if fmt in ("Test", "ODI", "T20I") else "ODI",
                        "t1": safe_get(match_info, "team1", "teamName", default=""),
                        "t2": safe_get(match_info, "team2", "teamName", default=""),
                        "mdate": datetime.now().date(),
                        "status": status,
                    },
                )
                processed += 1

    return processed


def sync_player_profile(player_name: str) -> dict:
    """
    Looks a player up via the API and inserts/updates them in MySQL.
    Returns the player record found (or {} if not found).
    """
    search_result = cricbuzz_api.get_player_search(player_name)
    players = safe_get(search_result, "player", default=[])
    if not players:
        return {}

    top_match = players[0]
    player_id_api = safe_get(top_match, "id")
    info = cricbuzz_api.get_player_info(player_id_api) if player_id_api else {}

    full_name = safe_get(info, "name", default=top_match.get("name", player_name))
    role = safe_get(info, "role", default="Batsman")
    role = role if role in ("Batsman", "Bowler", "All-rounder", "Wicket-keeper") else "Batsman"
    bat_style = safe_get(info, "bat", default=None)
    bowl_style = safe_get(info, "bowl", default=None)
    country = safe_get(info, "intlTeam", default="Unknown")

    existing = run_query(
        "SELECT player_id FROM players WHERE full_name = :name", {"name": full_name}
    )
    if existing.empty:
        execute_write(
            """
            INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style)
            VALUES (:name, :country, :role, :bat, :bowl)
            """,
            {"name": full_name, "country": country, "role": role, "bat": bat_style, "bowl": bowl_style},
        )

    return {"full_name": full_name, "country": country, "playing_role": role}
