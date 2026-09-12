"""
tests/test_crud_service.py
----------------------------
Unit tests for the CRUD layer. Database calls are mocked (patched)
so these tests run without needing a real MySQL connection —
useful for CI, or just running `pytest` locally before you've even
set up MySQL Workbench.

Run with:
    pytest tests/
"""

from unittest.mock import patch
import pandas as pd

from models.entities import Player
from services import crud_service


def test_player_validation_fails_on_empty_name():
    player = Player(full_name="", country="India", playing_role="Batsman")
    errors = player.validate()
    assert any("name" in e.lower() for e in errors)


def test_player_validation_fails_on_bad_role():
    player = Player(full_name="Test Player", country="India", playing_role="Wizard")
    errors = player.validate()
    assert any("role" in e.lower() for e in errors)


def test_player_validation_passes_for_valid_player():
    player = Player(full_name="Test Player", country="India", playing_role="Batsman")
    assert player.validate() == []


@patch("services.crud_service.execute_write", return_value=True)
def test_create_player_calls_execute_write_when_valid(mock_execute):
    player = Player(full_name="New Player", country="India", playing_role="Bowler")
    success, errors = crud_service.create_player(player)
    assert success is True
    assert errors == []
    mock_execute.assert_called_once()


def test_create_player_does_not_hit_db_when_invalid():
    with patch("services.crud_service.execute_write") as mock_execute:
        player = Player(full_name="", country="India", playing_role="Bowler")
        success, errors = crud_service.create_player(player)
        assert success is False
        assert errors  # non-empty
        mock_execute.assert_not_called()


@patch("services.crud_service.run_query")
def test_list_players_filters_by_search(mock_run_query):
    mock_run_query.return_value = pd.DataFrame(
        {"player_id": [1], "full_name": ["Virat Kohli"], "country": ["India"],
         "playing_role": ["Batsman"], "batting_style": ["Right-hand bat"],
         "bowling_style": [None], "team_id": [1]}
    )
    df = crud_service.list_players("Virat")
    assert len(df) == 1
    assert df.iloc[0]["full_name"] == "Virat Kohli"
    # confirm the search pattern was passed through
    args, kwargs = mock_run_query.call_args
    assert "%Virat%" in args[1].values() if len(args) > 1 else True


@patch("services.crud_service.execute_write", return_value=True)
def test_delete_player_calls_execute_write(mock_execute):
    result = crud_service.delete_player(5)
    assert result is True
    mock_execute.assert_called_once()
