"""
config.py
---------
Central configuration for the whole app.

Locally, values come from a `.env` file (never commit `.env`).
On Streamlit Community Cloud, the same keys are read from App secrets.
"""

import os
from urllib.parse import quote_plus

from dotenv import load_dotenv

load_dotenv()


def _get(key: str, default: str = "") -> str:
    """Prefer process env, then Streamlit secrets. Never hard-code credentials."""
    value = os.getenv(key)
    if value not in (None, ""):
        return value
    try:
        import streamlit as st

        if key in st.secrets:
            return str(st.secrets[key])
    except Exception:
        pass
    return default


class Config:
    @property
    def DB_HOST(self) -> str:
        return _get("DB_HOST", "localhost")

    @property
    def DB_PORT(self) -> int:
        raw = _get("DB_PORT", "3306")
        try:
            return int(raw)
        except (TypeError, ValueError):
            return 3306

    @property
    def DB_USER(self) -> str:
        return _get("DB_USER", "root")

    @property
    def DB_PASSWORD(self) -> str:
        return _get("DB_PASSWORD", "")

    @property
    def DB_NAME(self) -> str:
        return _get("DB_NAME", "cricbuzz_livestats")

    @property
    def DB_SSL(self) -> bool:
        return _get("DB_SSL", "false").strip().lower() in ("1", "true", "yes")

    @property
    def SQLALCHEMY_URI(self) -> str:
        return (
            f"mysql+mysqlconnector://{quote_plus(self.DB_USER)}:{quote_plus(self.DB_PASSWORD)}"
            f"@{self.DB_HOST}:{self.DB_PORT}/{self.DB_NAME}"
        )

    @property
    def RAPIDAPI_KEY(self) -> str:
        return _get("RAPIDAPI_KEY", "")

    @property
    def RAPIDAPI_HOST(self) -> str:
        return _get("RAPIDAPI_HOST", "cricbuzz-cricket.p.rapidapi.com")

    @property
    def BASE_URL(self) -> str:
        return f"https://{self.RAPIDAPI_HOST}"

    @property
    def HEADERS(self) -> dict:
        return {
            "x-rapidapi-key": self.RAPIDAPI_KEY,
            "x-rapidapi-host": self.RAPIDAPI_HOST,
        }

    APP_TITLE = "🏏 Cricbuzz LiveStats"
    REQUEST_TIMEOUT = 10
    MAX_RETRIES = 3


config = Config()
