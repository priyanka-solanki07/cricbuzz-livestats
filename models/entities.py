"""
models/entities.py
-------------------
Plain dataclasses representing our database entities.
These are used to pass validated, typed data between the
services layer and the CRUD/database layer — instead of
passing loose dicts around everywhere.
"""

from dataclasses import dataclass
from datetime import date
from typing import Optional


@dataclass
class Team:
    team_name: str
    country: str
    team_id: Optional[int] = None


@dataclass
class Venue:
    venue_name: str
    country: str
    city: Optional[str] = None
    capacity: int = 0
    venue_id: Optional[int] = None


@dataclass
class Player:
    full_name: str
    country: str
    playing_role: str          # Batsman / Bowler / All-rounder / Wicket-keeper
    batting_style: Optional[str] = None
    bowling_style: Optional[str] = None
    date_of_birth: Optional[date] = None
    team_id: Optional[int] = None
    player_id: Optional[int] = None

    def validate(self) -> list[str]:
        """Returns a list of validation error messages (empty = valid)."""
        errors = []
        if not self.full_name or not self.full_name.strip():
            errors.append("Full name is required.")
        if self.playing_role not in ("Batsman", "Bowler", "All-rounder", "Wicket-keeper"):
            errors.append("Playing role must be one of: Batsman, Bowler, All-rounder, Wicket-keeper.")
        if not self.country or not self.country.strip():
            errors.append("Country is required.")
        return errors


@dataclass
class Match:
    match_description: str
    match_format: str          # Test / ODI / T20I
    team1_id: int
    team2_id: int
    match_date: date
    venue_id: Optional[int] = None
    series_id: Optional[int] = None
    winning_team_id: Optional[int] = None
    victory_margin: Optional[int] = None
    victory_type: Optional[str] = None   # runs / wickets
    match_id: Optional[int] = None
