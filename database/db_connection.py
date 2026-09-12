"""
database/db_connection.py
--------------------------
Single, centralized place that creates and shares the MySQL connection
(engine) for the whole app. Every other module imports `get_engine()`
or `run_query()` from here instead of opening its own connection.
"""

import pandas as pd
import streamlit as st
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError

from config import config


@st.cache_resource(show_spinner=False)
def get_engine():
    """
    Creates (once, cached) a SQLAlchemy engine for MySQL.
    st.cache_resource ensures we don't reopen a new connection pool
    on every Streamlit rerun.
    """
    try:
        engine = create_engine(
            config.SQLALCHEMY_URI,
            pool_pre_ping=True,   # auto-reconnect if MySQL dropped idle connection
            pool_recycle=3600,
        )
        return engine
    except SQLAlchemyError as e:
        st.error(f"❌ Could not create database engine: {e}")
        raise


def run_query(sql: str, params: dict | None = None) -> pd.DataFrame:
    """
    Runs a SELECT query and returns a pandas DataFrame.
    Use this for every read-only / analytics query.
    """
    engine = get_engine()
    try:
        with engine.connect() as conn:
            result = conn.execute(text(sql), params or {})
            rows = result.fetchall()
            cols = result.keys()
            return pd.DataFrame(rows, columns=cols)
    except SQLAlchemyError as e:
        st.error(f"❌ Query failed: {e}")
        return pd.DataFrame()


def execute_write(sql: str, params: dict | None = None) -> bool:
    """
    Runs an INSERT / UPDATE / DELETE inside a transaction.
    Returns True on success, False on failure (and shows the error).
    """
    engine = get_engine()
    try:
        with engine.begin() as conn:   # begin() = auto commit/rollback
            conn.execute(text(sql), params or {})
        return True
    except SQLAlchemyError as e:
        st.error(f"❌ Write operation failed: {e}")
        return False


def test_connection() -> bool:
    """Quick health check used on the Home page."""
    try:
        engine = get_engine()
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        return True
    except Exception:
        return False
