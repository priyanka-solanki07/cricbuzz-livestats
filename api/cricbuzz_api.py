"""
api/cricbuzz_api.py
--------------------
Thin wrapper around the Cricbuzz Cricket API (via RapidAPI).
Every function here:
  1. Builds the right endpoint URL
  2. Sends the request with headers from config
  3. Retries on transient failures
  4. Returns parsed JSON (dict) or {} on failure — callers never
     have to deal with raw `requests` exceptions.
"""

import time
import requests
import streamlit as st

from config import config


def _get(endpoint: str, params: dict | None = None) -> dict:
    """
    Internal helper: GET <BASE_URL><endpoint> with retry + backoff.
    """
    url = f"{config.BASE_URL}{endpoint}"

    for attempt in range(1, config.MAX_RETRIES + 1):
        try:
            response = requests.get(
                url,
                headers=config.HEADERS,
                params=params or {},
                timeout=config.REQUEST_TIMEOUT,
            )
            response.raise_for_status()
            return response.json()

        except requests.exceptions.HTTPError as e:
            status = response.status_code if 'response' in locals() else None
            if status == 429:
                # Rate limited — wait and retry
                st.warning("⏳ API rate limit hit, retrying...")
                time.sleep(2 * attempt)
                continue
            st.error(f"❌ API HTTP error ({status}): {e}")
            break

        except requests.exceptions.ConnectionError:
            st.warning(f"⚠️ Connection error, attempt {attempt}/{config.MAX_RETRIES}...")
            time.sleep(1.5 * attempt)

        except requests.exceptions.Timeout:
            st.warning(f"⚠️ Request timed out, attempt {attempt}/{config.MAX_RETRIES}...")
            time.sleep(1.5 * attempt)

        except ValueError:
            st.error("❌ API returned invalid JSON.")
            break

    return {}


# ---------------------------------------------------------------
# Public endpoint functions — add more as you explore the API docs
# ---------------------------------------------------------------

def get_live_matches() -> dict:
    """Currently live matches across all formats."""
    return _get("/matches/v1/live")


def get_recent_matches() -> dict:
    """Recently completed matches."""
    return _get("/matches/v1/recent")


def get_upcoming_matches() -> dict:
    """Upcoming scheduled matches."""
    return _get("/matches/v1/upcoming")


def get_match_scorecard(match_id: int) -> dict:
    """Full scorecard for a given match id."""
    return _get(f"/mcenter/v1/{match_id}/scard")


def get_player_search(player_name: str) -> dict:
    """Search a player by name to get their player_id."""
    return _get("/stats/v1/player/search", params={"plrN": player_name})


def get_player_info(player_id: int) -> dict:
    """Player profile: role, batting/bowling style, DOB, etc."""
    return _get(f"/stats/v1/player/{player_id}")


def get_player_career_stats(player_id: int) -> dict:
    """Batting/bowling career summary for a player."""
    return _get(f"/stats/v1/player/{player_id}/career")


def get_icc_rankings(format_type: str = "test", category: str = "batsmen") -> dict:
    """ICC rankings — format_type: test/odi/t20, category: batsmen/bowlers/allrounders."""
    return _get(f"/stats/v1/rankings/{category}", params={"formatType": format_type})


def get_series_list(year: int | None = None) -> dict:
    """All series, optionally filtered by year."""
    endpoint = "/series/v1/international" if year is None else f"/series/v1/archives/international/{year}"
    return _get(endpoint)
