from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# CORS 허용: React/Streamlit에서 API 호출 가능하게
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 테스트용으로 모든 도메인 허용
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "Hello, FastAPI is running!"}

@app.get("/data")
def get_data():
    return {"data": [1,2,3,4,5]}
