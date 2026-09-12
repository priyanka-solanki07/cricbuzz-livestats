"""
pages/4_CRUD_Operations.py
----------------------------
Form-based Create / Read / Update / Delete UI for the `players` table.
All the actual DB logic lives in services/crud_service.py — this file
is only responsible for rendering widgets and wiring them up.
"""

import streamlit as st

from services import crud_service
from models.entities import Player
from utils.error_handler import safe_action, show_validation_errors

st.set_page_config(page_title="CRUD Operations", page_icon="⚙️", layout="wide")
st.title("⚙️ CRUD Operations — Players")

ROLES = ["Batsman", "Bowler", "All-rounder", "Wicket-keeper"]

tab_read, tab_create, tab_update, tab_delete = st.tabs(
    ["📖 Read", "➕ Create", "✏️ Update", "🗑️ Delete"]
)

# ---------------- READ ----------------
with tab_read:
    search = st.text_input("Search by name (leave blank for all players)")
    df = crud_service.list_players(search)
    if df.empty:
        st.info("No players found. Add one from the **Create** tab.")
    else:
        st.dataframe(df, use_container_width=True, hide_index=True)

# ---------------- CREATE ----------------
with tab_create:
    with st.form("create_player_form", clear_on_submit=True):
        full_name = st.text_input("Full name *")
        country = st.text_input("Country *")
        role = st.selectbox("Playing role *", ROLES)
        bat_style = st.text_input("Batting style (e.g. Right-hand bat)")
        bowl_style = st.text_input("Bowling style (e.g. Right-arm fast)")
        submitted = st.form_submit_button("➕ Add player")

    if submitted:
        player = Player(
            full_name=full_name,
            country=country,
            playing_role=role,
            batting_style=bat_style or None,
            bowling_style=bowl_style or None,
        )

        @safe_action("creating player")
        def _create():
            success, errors = crud_service.create_player(player)
            if show_validation_errors(errors):
                return
            if success:
                st.success(f"✅ Added player '{player.full_name}'.")
            else:
                st.error("❌ Could not add player — see error above.")

        _create()

# ---------------- UPDATE ----------------
with tab_update:
    all_players = crud_service.list_players()
    if all_players.empty:
        st.info("No players yet to update.")
    else:
        options = dict(zip(all_players["full_name"], all_players["player_id"]))
        picked_name = st.selectbox("Choose a player to edit", options.keys())
        pid = options[picked_name]
        row = all_players[all_players["player_id"] == pid].iloc[0]

        with st.form("update_player_form"):
            full_name = st.text_input("Full name *", value=row["full_name"])
            country = st.text_input("Country *", value=row["country"])
            role = st.selectbox(
                "Playing role *", ROLES,
                index=ROLES.index(row["playing_role"]) if row["playing_role"] in ROLES else 0,
            )
            bat_style = st.text_input("Batting style", value=row["batting_style"] or "")
            bowl_style = st.text_input("Bowling style", value=row["bowling_style"] or "")
            submitted = st.form_submit_button("✏️ Save changes")

        if submitted:
            player = Player(
                player_id=int(pid),
                full_name=full_name,
                country=country,
                playing_role=role,
                batting_style=bat_style or None,
                bowling_style=bowl_style or None,
            )

            @safe_action("updating player")
            def _update():
                success, errors = crud_service.update_player(player)
                if show_validation_errors(errors):
                    return
                if success:
                    st.success(f"✅ Updated '{player.full_name}'.")
                else:
                    st.error("❌ Could not update player — see error above.")

            _update()

# ---------------- DELETE ----------------
with tab_delete:
    all_players = crud_service.list_players()
    if all_players.empty:
        st.info("No players yet to delete.")
    else:
        options = dict(zip(all_players["full_name"], all_players["player_id"]))
        picked_name = st.selectbox("Choose a player to delete", options.keys(), key="delete_select")
        pid = options[picked_name]

        st.warning(f"This will permanently delete **{picked_name}** and all their stats.")
        confirm = st.checkbox("Yes, I'm sure")

        @safe_action("deleting player")
        def _delete():
            if crud_service.delete_player(int(pid)):
                st.success(f"✅ Deleted '{picked_name}'.")
            else:
                st.error("❌ Could not delete player — see error above.")

        if st.button("🗑️ Delete player", disabled=not confirm):
            _delete()
