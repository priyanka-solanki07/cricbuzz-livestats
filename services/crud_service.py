"""
services/crud_service.py
--------------------------
All Create / Read / Update / Delete logic for `players` lives here,
kept separate from the Streamlit page so it's testable on its own
(see tests/test_crud_service.py) and reusable.
"""

import pandas as pd

from database.db_connection import run_query, execute_write
from models.entities import Player


def list_players(search: str = "") -> pd.DataFrame:
    """Read: returns all players, optionally filtered by name substring."""
    if search:
        return run_query(
            """
            SELECT player_id, full_name, country, playing_role,
                   batting_style, bowling_style, team_id
            FROM players
            WHERE full_name LIKE :pattern
            ORDER BY full_name
            """,
            {"pattern": f"%{search}%"},
        )
    return run_query(
        """
        SELECT player_id, full_name, country, playing_role,
               batting_style, bowling_style, team_id
        FROM players
        ORDER BY full_name
        """
    )


def get_player(player_id: int) -> pd.DataFrame:
    return run_query(
        "SELECT * FROM players WHERE player_id = :pid", {"pid": player_id}
    )


def create_player(player: Player) -> tuple[bool, list[str]]:
    """Create: validates then inserts a new player. Returns (success, errors)."""
    errors = player.validate()
    if errors:
        return False, errors

    success = execute_write(
        """
        INSERT INTO players (full_name, country, playing_role, batting_style, bowling_style, team_id)
        VALUES (:name, :country, :role, :bat, :bowl, :team)
        """,
        {
            "name": player.full_name.strip(),
            "country": player.country.strip(),
            "role": player.playing_role,
            "bat": player.batting_style,
            "bowl": player.bowling_style,
            "team": player.team_id,
        },
    )
    return success, []


def update_player(player: Player) -> tuple[bool, list[str]]:
    """Update: validates then updates an existing player by player_id."""
    if player.player_id is None:
        return False, ["player_id is required for update."]

    errors = player.validate()
    if errors:
        return False, errors

    success = execute_write(
        """
        UPDATE players
        SET full_name = :name, country = :country, playing_role = :role,
            batting_style = :bat, bowling_style = :bowl, team_id = :team
        WHERE player_id = :pid
        """,
        {
            "name": player.full_name.strip(),
            "country": player.country.strip(),
            "role": player.playing_role,
            "bat": player.batting_style,
            "bowl": player.bowling_style,
            "team": player.team_id,
            "pid": player.player_id,
        },
    )
    return success, []


def delete_player(player_id: int) -> bool:
    """Delete: removes a player (cascades to their stats via FK ON DELETE CASCADE)."""
    return execute_write(
        "DELETE FROM players WHERE player_id = :pid", {"pid": player_id}
    )
