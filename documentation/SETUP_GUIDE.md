# Setup Guide — VS Code + MySQL Workbench Workflow

This guide assumes: you'll write/run the Python code in **VS Code**, and
manage the database in **MySQL Workbench** (as you already have both).

## Step 1 — Open the project in VS Code
1. Unzip the project folder.
2. `File → Open Folder` → select `cricbuzz_livestats/`.
3. Open a terminal in VS Code (`` Ctrl+` ``).

## Step 2 — Create a virtual environment
```bash
python -m venv venv
```
Activate it:
- Windows: `venv\Scripts\activate`
- macOS/Linux: `source venv/bin/activate`

VS Code will usually prompt "Select Interpreter" — pick the one inside `venv`.

## Step 3 — Install dependencies
```bash
pip install -r requirements.txt
```

## Step 4 — Create the database (MySQL Workbench)
1. Open MySQL Workbench, connect to your local MySQL instance.
2. `File → Open SQL Script...` → select `database/schema.sql`.
3. Click the ⚡ lightning-bolt "Execute" button. This creates the
   `cricbuzz_livestats` database + all tables + 2 views.
4. Optionally repeat for `database/seed_sample_data.sql` to load sample data.
5. In the left "Schemas" panel, refresh — you should see `cricbuzz_livestats`
   with 9 tables + 2 views.

## Step 5 — Configure credentials
1. In VS Code, duplicate `.env.example` and rename the copy to `.env`.
2. Fill in your MySQL Workbench username/password and (once you have it)
   your RapidAPI key.
   > `.env` is already listed as a place to keep secrets out of git —
   > never commit it.

## Step 6 — Run the app
```bash
streamlit run app.py
```
VS Code will show the terminal output with a local URL — Ctrl+click it to
open in your browser.

## Common issues

| Symptom | Likely cause | Fix |
|---|---|---|
| `Could not create database engine` | MySQL not running, or wrong password | Start MySQL service; double-check `.env` |
| `Access denied for user` | Wrong `DB_USER`/`DB_PASSWORD` | Confirm the same credentials work in MySQL Workbench |
| Live Matches page shows nothing | `RAPIDAPI_KEY` missing/invalid | Re-check `.env`, confirm subscription is active on RapidAPI |
| SQL Analytics queries return 0 rows | No data yet | Run `database/seed_sample_data.sql`, or sync real matches first |
| `ModuleNotFoundError: No module named 'streamlit'` | venv not activated / not installed | Re-activate venv, re-run `pip install -r requirements.txt` |
