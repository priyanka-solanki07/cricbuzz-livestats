"""
app.py
------
Main entry point for the Streamlit app. This file IS the Home page;
Streamlit automatically picks up every file inside pages/ and adds
it to the sidebar navigation.

Run with:
    streamlit run app.py
"""

import streamlit as st
from config import config
from database.db_connection import test_connection

st.set_page_config(
    page_title=config.APP_TITLE,
    page_icon="🏏",
    layout="wide",
)

st.title(config.APP_TITLE)
st.caption("Real-Time Cricket Insights & SQL-Based Analytics")

# ---------------- Connection health check ----------------
col1, col2 = st.columns(2)
with col1:
    if test_connection():
        st.success("✅ MySQL database connected")
    else:
        st.error("❌ MySQL not connected — check your `.env` file and that MySQL is running.")

with col2:
    if config.RAPIDAPI_KEY:
        st.success("✅ Cricbuzz API key detected")
    else:
        st.warning("⚠️ RAPIDAPI_KEY not set in `.env` — Live Matches / Top Players pages need it.")

st.divider()

st.markdown(
    """
    ### 👋 Welcome!
    Use the sidebar to navigate:

    | Page | What it does |
    |---|---|
    | 🔴 **Live Matches** | Live scorecards & match status straight from the Cricbuzz API |
    | 📊 **Top Player Stats** | Most runs / wickets / rankings fetched via the API |
    | 🧮 **SQL Analytics** | All 25 practice SQL queries, run live against MySQL |
    | ⚙️ **CRUD Operations** | Add / edit / delete player records in the database |

    ---
    ### 🛠️ First-time setup
    1. Copy `.env.example` → `.env` and fill in your MySQL + RapidAPI credentials.
    2. In **MySQL Workbench**, run `database/schema.sql` once to create the database & tables.
    3. `pip install -r requirements.txt`
    4. `streamlit run app.py`

    See `README.md` for the full guide.
    """
)

with st.expander("📁 Project folder structure"):
    st.code(
        """
cricbuzz_livestats/
├── app.py                  # Home page (this file)
├── config.py                # Loads .env, central settings
├── requirements.txt
├── .env.example
├── database/
│   ├── schema.sql            # CREATE TABLE statements (run in MySQL Workbench)
│   └── db_connection.py      # SQLAlchemy engine, run_query(), execute_write()
├── api/
│   └── cricbuzz_api.py       # All Cricbuzz/RapidAPI endpoint calls
├── services/
│   ├── data_sync_service.py  # Pulls API data → inserts into MySQL
│   └── crud_service.py       # Create/Read/Update/Delete for players
├── models/
│   └── entities.py           # Player/Team/Match/Venue dataclasses + validation
├── sql/
│   ├── queries.py             # All 25 SQL questions (Python dict, used by the app)
│   └── analytics_queries.sql  # Same 25 queries, plain SQL reference copy
├── utils/
│   ├── helpers.py             # safe_get(), formatting helpers
│   └── error_handler.py       # @safe_action decorator, validation display
├── pages/
│   ├── 1_🔴_Live_Matches.py
│   ├── 2_📊_Top_Player_Stats.py
│   ├── 3_🧮_SQL_Analytics.py
│   └── 4_⚙️_CRUD_Operations.py
├── documentation/
│   └── SETUP_GUIDE.md
└── tests/
    └── test_crud_service.py
        """,
        language="text",
    )
