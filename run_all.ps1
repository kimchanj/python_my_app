# my_app\run_all.ps1

function Start-App {
    param (
        [string]$Name,
        [string]$Command,
        [string]$Url
    )
    Write-Host "`nStarting $Name..." -ForegroundColor Green
    Start-Process powershell -ArgumentList "-NoExit", "-Command", $Command

    if ($Url) {
        # 브라우저 열기 2초 뒤
        Start-Sleep -Seconds 2
        Write-Host "Opening $Name in browser: $Url" -ForegroundColor Cyan
        Start-Process $Url
    }
}

Write-Host "=== Starting all apps ===" -ForegroundColor Cyan

# FastAPI backend
$fastapiCommand = "cd $PWD\backend; venv\Scripts\activate; uvicorn main:app --port 8001 --reload"
Start-App -Name "FastAPI backend" -Command $fastapiCommand -Url "http://127.0.0.1:8001/docs"

# Streamlit
$streamlitCommand = "cd $PWD\frontend; venv\Scripts\activate; streamlit run streamlit_app.py"
Start-App -Name "Streamlit" -Command $streamlitCommand -Url ""

# React
$reactCommand = "cd $PWD\frontend\react_app; npm start"
Start-App -Name "React app" -Command $reactCommand -Url "http://localhost:3001"

# Vue
$vueCommand = "cd $PWD\frontend\vue_app; npm run serve"
Start-App -Name "Vue app" -Command $vueCommand -Url "http://localhost:5173"

Write-Host "`n=== All apps started ===" -ForegroundColor Cyan
