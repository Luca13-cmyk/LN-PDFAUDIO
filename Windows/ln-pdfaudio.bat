@echo off

REM Set the path to the Python script
set "PYTHON_SCRIPT_PATH=../ln-pdfaudio.py"

REM Activate the virtual environment in a separate command prompt session
call .venv\Scripts\activate.bat

REM Check if the activation was successful
if errorlevel 1 (
    echo Failed to activate the virtual environment.
    exit /b 1
) else (
    echo Virtual environment activated successfully.
)

REM Run the Streamlit command
streamlit run %PYTHON_SCRIPT_PATH%

REM Deactivate the virtual environment
deactivate
