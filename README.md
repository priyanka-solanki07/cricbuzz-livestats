# 🏏 Cricbuzz LiveStats — Real-Time Cricket Insights & SQL-Based Analytics

A Streamlit dashboard that combines the **Cricbuzz API** (via RapidAPI) with a
**MySQL** database to deliver live match updates, player stats, 25 SQL
analytics queries, and full CRUD operations on player data.

---

## 📁 Folder Structure

```
cricbuzz_livestats/
├── app.py                     # Home page (Streamlit entry point)
├── config.py                   # Loads .env, central settings for DB + API
├── requirements.txt
├── .env.example                 # Copy to .env and fill in your credentials
│
├── database/
│   ├── schema.sql               # CREATE TABLE statements — run once in MySQL Workbench
│   ├── seed_sample_data.sql     # OPTIONAL: sample data so you can test queries immediately
│   └── db_connection.py         # SQLAlchemy engine, run_query(), execute_write()
│
├── api/
│   └── cricbuzz_api.py          # All Cricbuzz/RapidAPI endpoint wrapper functions
│
├── services/
│   ├── data_sync_service.py     # Pulls data from the API → inserts into MySQL
│   └── crud_service.py          # Create/Read/Update/Delete logic for players
│
├── models/
│   └── entities.py               # Player/Team/Match/Venue dataclasses + validation
│
├── sql/
│   ├── queries.py                 # All 25 SQL questions as a Python dict (used by the app)
│   └── analytics_queries.sql      # Same 25 queries, plain SQL reference copy
│
├── utils/
│   ├── helpers.py                 # safe_get(), number formatting, dropdown builders
│   └── error_handler.py           # @safe_action decorator, validation display helper
│
├── pages/                          # Streamlit auto-detects these as extra nav pages
│   ├── 1_🔴_Live_Matches.py
│   ├── 2_📊_Top_Player_Stats.py
│   ├── 3_🧮_SQL_Analytics.py
│   └── 4_⚙️_CRUD_Operations.py
│
├── documentation/
│   └── SETUP_GUIDE.md
│
├── tests/
│   └── test_crud_service.py
│
├── assets/ , images/ , data/       # empty — for screenshots / exports as you build
```

---

## 🛠️ Setup (step-by-step)

### 1. Install dependencies
```bash
python -m venv venv
venv\Scripts\activate        # Windows
# source venv/bin/activate   # macOS/Linux

pip install -r requirements.txt
```

### 2. Set up MySQL (using MySQL Workbench, since that's what you have)
1. Open **MySQL Workbench** → connect to your local server.
2. Open `database/schema.sql` → run it (⚡ lightning bolt icon). This creates the
   `cricbuzz_livestats` database and every table.
3. **(Recommended for testing)** Open `database/seed_sample_data.sql` → run it.
   This loads realistic sample data (teams, players, ~60 matches spread across
   2019–2026 with batting/bowling/fielding stats) so all 25 SQL queries return
   results immediately — you don't have to wait on API syncing to see the
   dashboard work.

### 3. Get your Cricbuzz API key
1. Go to https://rapidapi.com/cricketapilive/api/cricbuzz-cricket/
2. Subscribe to the free tier → copy your `X-RapidAPI-Key`.

### 4. Configure `.env`
```bash
cp .env.example .env
```
Open `.env` in VS Code and fill in:
```
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=<your MySQL Workbench password>
DB_NAME=cricbuzz_livestats

RAPIDAPI_KEY=<your key>
RAPIDAPI_HOST=cricbuzz-cricket.p.rapidapi.com
```

### 5. Run the app
```bash
streamlit run app.py
```
It opens at `http://localhost:8501`.

---

## 📌 What each page does

| Page | Purpose |
|---|---|
| 🏠 Home | Connection health checks + project overview |
| 🔴 Live Matches | Live/recent/upcoming matches from the API; button to sync into MySQL |
| 📊 Top Player Stats | Search any player, view career stats, ICC rankings |
| 🧮 SQL Analytics | Pick any of the 25 practice questions, run it live against MySQL, export CSV |
| ⚙️ CRUD Operations | Add / view / edit / delete player records |

---

## 🧮 About the 25 SQL Questions

They're organized Beginner (1–8) → Intermediate (9–16) → Advanced (17–25),
covering `SELECT`/`GROUP BY`, `JOIN`s + subqueries, and window
functions/CTEs respectively. All 25 are implemented and runnable from the
**SQL Analytics** page — see `sql/queries.py` for the Python-side version and
`sql/analytics_queries.sql` for a plain-SQL copy (handy for viva/interview
revision).

---

## ⚠️ Notes & Known Limitations

- **Sample data is synthetic.** `seed_sample_data.sql` generates realistic
  but *fictional* match-by-match stats so you can test/demo the app and all
  25 queries before you've synced real data. Feel free to keep it during
  development and swap in real Cricbuzz-synced data later.
- **The Cricbuzz API mainly gives current/recent data**, not deep multi-year
  history — so queries like Q19 ("since 2022") or Q25 ("quarterly trend")
  will need you to keep syncing over time (or rely on the seed data) to be
  meaningful.
- **Error handling**: every DB call and API call is wrapped (see
  `utils/error_handler.py` and try/except blocks in `db_connection.py` /
  `cricbuzz_api.py`), so a bad connection or a 429 rate limit shows a
  friendly message instead of crashing the app.

---

## 🚀 Next Steps / Possible Improvements
- Add authentication (admin-only CRUD)
- Docker Compose file (app + MySQL) for one-command setup
- Scheduled sync (cron/Airflow) instead of manual "Sync" buttons
- Deploy to Streamlit Community Cloud (with a managed MySQL like PlanetScale/Railway)
