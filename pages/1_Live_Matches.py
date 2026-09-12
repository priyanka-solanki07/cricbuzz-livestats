"""
pages/1_Live_Matches.py
------------------------
Shows currently live matches (and recent/upcoming) straight from the
Cricbuzz API. A "Sync to database" button pushes what's fetched into
MySQL via services/data_sync_service.py.
"""

import streamlit as st

from api import cricbuzz_api
from services.data_sync_service import sync_live_matches
from utils.helpers import safe_get
from utils.error_handler import safe_action

st.set_page_config(page_title="Live Matches", page_icon="🔴", layout="wide")
st.title("🔴 Live Matches")

tab_live, tab_recent, tab_upcoming = st.tabs(["🔴 Live", "✅ Recent", "🗓️ Upcoming"])


def render_matches(data: dict, empty_msg: str):
    type_matches = safe_get(data, "typeMatches", default=[])
    if not type_matches:
        st.info(empty_msg)
        return

    for type_match in type_matches:
        match_type_name = safe_get(type_match, "matchType", default="")
        for series_match in safe_get(type_match, "seriesMatches", default=[]):
            series_wrapper = safe_get(series_match, "seriesAdWrapper", default={})
            series_name = safe_get(series_wrapper, "seriesName", default="")
            matches = safe_get(series_wrapper, "matches", default=[])
            if not matches:
                continue

            st.subheader(f"{match_type_name} — {series_name}")
            for match in matches:
                info = safe_get(match, "matchInfo", default={})
                team1 = safe_get(info, "team1", "teamName", default="Team 1")
                team2 = safe_get(info, "team2", "teamName", default="Team 2")
                venue = safe_get(info, "venueInfo", "ground", default="")
                city = safe_get(info, "venueInfo", "city", default="")
                status = safe_get(info, "status", default="Status unavailable")
                desc = safe_get(info, "matchDesc", default="")

                with st.container(border=True):
                    st.markdown(f"**{team1} 🆚 {team2}**  \n{desc}")
                    st.caption(f"📍 {venue}, {city}")
                    st.info(status)


with tab_live:
    if st.button("🔄 Refresh live matches"):
        st.cache_data.clear()
    with st.spinner("Fetching live matches..."):
        live_data = cricbuzz_api.get_live_matches()
    render_matches(live_data, "No live matches right now.")

    st.divider()

    @safe_action("syncing live matches")
    def _sync():
        count = sync_live_matches()
        st.success(f"✅ Synced {count} match record(s) to MySQL.")

    if st.button("💾 Sync live matches to database"):
        _sync()

with tab_recent:
    with st.spinner("Fetching recent matches..."):
        recent_data = cricbuzz_api.get_recent_matches()
    render_matches(recent_data, "No recent matches found.")

with tab_upcoming:
    with st.spinner("Fetching upcoming matches..."):
        upcoming_data = cricbuzz_api.get_upcoming_matches()
    render_matches(upcoming_data, "No upcoming matches found.")
