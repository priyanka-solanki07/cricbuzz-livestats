"""
pages/2_Top_Player_Stats.py
-----------------------------
Player search + ICC rankings, fetched live from the Cricbuzz API.
"""

import streamlit as st

from api import cricbuzz_api
from services.data_sync_service import sync_player_profile
from utils.helpers import safe_get
from utils.error_handler import safe_action

st.set_page_config(page_title="Top Player Stats", page_icon="📊", layout="wide")
st.title("📊 Top Player Stats")

tab_search, tab_rankings = st.tabs(["🔎 Player Search", "🏆 ICC Rankings"])

# ---------------- Player search ----------------
with tab_search:
    name = st.text_input("Search a player by name", placeholder="e.g. Virat Kohli")

    if st.button("Search") and name.strip():
        with st.spinner(f"Searching for '{name}'..."):
            result = cricbuzz_api.get_player_search(name)
        players = safe_get(result, "player", default=[])

        if not players:
            st.warning("No player found with that name.")
        else:
            for pl in players[:5]:
                pid = safe_get(pl, "id")
                pname = safe_get(pl, "name", default=name)
                team = safe_get(pl, "teamName", default="")

                with st.container(border=True):
                    st.markdown(f"**{pname}**  ({team})")

                    col1, col2 = st.columns(2)
                    with col1:
                        if st.button("📄 View career stats", key=f"career_{pid}"):
                            with st.spinner("Loading career stats..."):
                                career = cricbuzz_api.get_player_career_stats(pid)
                            st.json(career)

                    with col2:
                        @safe_action("saving player to database")
                        def _save(pname=pname):
                            saved = sync_player_profile(pname)
                            if saved:
                                st.success(f"✅ Saved '{saved['full_name']}' to MySQL.")
                            else:
                                st.warning("Could not resolve player details to save.")

                        if st.button("💾 Save to database", key=f"save_{pid}"):
                            _save()

# ---------------- ICC Rankings ----------------
with tab_rankings:
    col1, col2 = st.columns(2)
    with col1:
        fmt = st.selectbox("Format", ["test", "odi", "t20"])
    with col2:
        category = st.selectbox("Category", ["batsmen", "bowlers", "allrounders"])

    if st.button("Fetch rankings"):
        with st.spinner("Fetching ICC rankings..."):
            rankings = cricbuzz_api.get_icc_rankings(fmt, category)
        rows = safe_get(rankings, "rank", default=[])
        if not rows:
            st.info("No ranking data returned.")
        else:
            table = [
                {
                    "Rank": safe_get(r, "rank"),
                    "Player": safe_get(r, "name"),
                    "Country": safe_get(r, "country"),
                    "Rating": safe_get(r, "rating"),
                }
                for r in rows
            ]
            st.dataframe(table, use_container_width=True, hide_index=True)
