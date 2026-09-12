"""
pages/3_SQL_Analytics.py
--------------------------
Runs any of the 25 SQL practice questions (sql/queries.py) live
against MySQL and shows the results as a table. Includes an option
to view the raw SQL, and to export results to CSV.
"""

import streamlit as st

from database.db_connection import run_query
from sql.queries import QUERIES

st.set_page_config(page_title="SQL Analytics", page_icon="🧮", layout="wide")
st.title("🧮 SQL Queries & Analytics")
st.caption("25 practice questions — Beginner → Intermediate → Advanced")

# ---------------- Sidebar filter by level ----------------
level_filter = st.sidebar.multiselect(
    "Filter by level",
    ["Beginner", "Intermediate", "Advanced"],
    default=["Beginner", "Intermediate", "Advanced"],
)

visible_questions = {
    num: q for num, q in QUERIES.items() if q["level"] in level_filter
}

if not visible_questions:
    st.warning("No questions match the selected filter.")
    st.stop()

labels = {num: f"Q{num} ({q['level']}) — {q['title']}" for num, q in visible_questions.items()}
selected_num = st.selectbox(
    "Choose a question",
    options=list(labels.keys()),
    format_func=lambda n: labels[n],
)

question = QUERIES[selected_num]

st.subheader(f"Q{selected_num}. {question['title']}")
st.caption(f"Difficulty: {question['level']}")

with st.expander("👀 View SQL query"):
    st.code(question["sql"].strip(), language="sql")

if st.button("▶️ Run query", type="primary"):
    with st.spinner("Running query against MySQL..."):
        df = run_query(question["sql"], question.get("params"))

    if df.empty:
        st.info("Query ran successfully but returned no rows. (Have you loaded sample data yet?)")
    else:
        st.success(f"✅ {len(df)} row(s) returned")
        st.dataframe(df, use_container_width=True)

        csv = df.to_csv(index=False).encode("utf-8")
        st.download_button(
            "⬇️ Download as CSV",
            data=csv,
            file_name=f"query_{selected_num}_result.csv",
            mime="text/csv",
        )

        # Quick auto-chart when there's an obvious numeric column to plot
        numeric_cols = df.select_dtypes(include="number").columns.tolist()
        text_cols = df.select_dtypes(exclude="number").columns.tolist()
        if numeric_cols and text_cols:
            with st.expander("📈 Quick chart"):
                x_col = st.selectbox("X axis (category)", text_cols, key=f"x_{selected_num}")
                y_col = st.selectbox("Y axis (value)", numeric_cols, key=f"y_{selected_num}")
                st.bar_chart(df.set_index(x_col)[y_col])
