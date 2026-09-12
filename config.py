"""
config.py
---------
Central configuration for the whole app.
Loads secrets/settings from a `.env` file so nothing sensitive is hard-coded.

Copy `.env.example` to `.env` and fill in your real values before running.
"""

import os
from urllib.parse import quote_plus
from dotenv import load_dotenv

# Load variables from .env into environment
load_dotenv()


class Config:
    # ---------------- MySQL ----------------
    DB_HOST = os.getenv("DB_HOST", "localhost")
    DB_PORT = int(os.getenv("DB_PORT", 3306))
    DB_USER = os.getenv("DB_USER", "root")
    DB_PASSWORD = os.getenv("DB_PASSWORD", "")
    DB_NAME = os.getenv("DB_NAME", "cricbuzz_livestats")

    # SQLAlchemy connection string (mysql-connector-python driver)
    SQLALCHEMY_URI = (
        f"mysql+mysqlconnector://{quote_plus(DB_USER)}:{quote_plus(DB_PASSWORD)}"
        f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )

    # ---------------- Cricbuzz API (RapidAPI) ----------------
    RAPIDAPI_KEY = os.getenv("RAPIDAPI_KEY", "")
    RAPIDAPI_HOST = os.getenv("RAPIDAPI_HOST", "cricbuzz-cricket.p.rapidapi.com")
    BASE_URL = f"https://{RAPIDAPI_HOST}"

    HEADERS = {
        "x-rapidapi-key": RAPIDAPI_KEY,
        "x-rapidapi-host": RAPIDAPI_HOST,
    }

    # ---------------- App ----------------
    APP_TITLE = "🏏 Cricbuzz LiveStats"
    REQUEST_TIMEOUT = 10          # seconds, for every API call
    MAX_RETRIES = 3               # retry attempts on failed API calls


config = Config()