import streamlit as st
import requests

st.title("Streamlit + FastAPI Test")

if st.button("Load Data from FastAPI"):
    response = requests.get("http://127.0.0.1:8001/data")
    if response.status_code == 200:
        st.write(response.json())
    else:
        st.error("Failed to load data")
