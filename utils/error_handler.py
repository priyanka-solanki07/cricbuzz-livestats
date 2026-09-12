"""
utils/error_handler.py
-----------------------
Small decorators/helpers so every page doesn't have to write its
own try/except boilerplate for the same recurring failure modes:
API errors, DB errors, and bad user input.
"""

import functools
import streamlit as st
from sqlalchemy.exc import SQLAlchemyError
import requests


def safe_action(action_name: str = "action"):
    """
    Decorator for Streamlit callback functions (button clicks, form
    submits). Catches the common exception types and shows a friendly
    message instead of a raw traceback.
    """
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            try:
                return func(*args, **kwargs)
            except SQLAlchemyError as e:
                st.error(f"❌ Database error during {action_name}: {e}")
            except requests.exceptions.RequestException as e:
                st.error(f"❌ Network/API error during {action_name}: {e}")
            except ValueError as e:
                st.warning(f"⚠️ Invalid input during {action_name}: {e}")
            except Exception as e:  # last-resort catch-all
                st.error(f"❌ Unexpected error during {action_name}: {e}")
            return None
        return wrapper
    return decorator


def show_validation_errors(errors: list[str]) -> bool:
    """
    Displays a list of validation error strings via st.error.
    Returns True if there were errors (so caller can `if show_validation_errors(...): return`).
    """
    if errors:
        for e in errors:
            st.error(f"⚠️ {e}")
        return True
    return False
