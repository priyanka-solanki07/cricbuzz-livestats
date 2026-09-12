"""
utils/helpers.py
-----------------
Small reusable helper functions: safe dict lookups, number
formatting, dropdown option builders, etc.
"""

import pandas as pd


def safe_get(d: dict, *keys, default=None):
    """
    Safely walk a nested dict without KeyError/TypeError, e.g.
    safe_get(match, "matchInfo", "team1", "teamName")
    """
    cur = d
    for k in keys:
        if isinstance(cur, dict) and k in cur:
            cur = cur[k]
        else:
            return default
    return cur


def df_or_empty_msg(df: pd.DataFrame, empty_message: str = "No data found.") -> bool:
    """
    Returns True (and lets caller `st.info(...)`) when df is empty,
    so pages can do: `if df_or_empty_msg(df): return` pattern... but
    simpler: just use directly with st.
    """
    return df.empty


def format_number(n) -> str:
    """1234567 -> '1,234,567' ; None -> '-' """
    if n is None or (isinstance(n, float) and pd.isna(n)):
        return "-"
    try:
        return f"{n:,.2f}" if isinstance(n, float) else f"{n:,}"
    except (ValueError, TypeError):
        return str(n)


def dropdown_options(df: pd.DataFrame, id_col: str, label_col: str) -> dict:
    """
    Build {label: id} dict from a DataFrame — handy for
    st.selectbox(options=dropdown_options(...).keys()) patterns.
    """
    if df.empty:
        return {}
    return dict(zip(df[label_col], df[id_col]))
