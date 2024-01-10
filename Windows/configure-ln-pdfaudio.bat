@echo off
set "BATCH_FILE_PATH=ln-pdfaudio.bat"
set "REQUIREMENTS_PATH=../requirements.txt"
set "PYTHON_SCRIPT_PATH=../ln-pdfaudio.py"

REM Check if the batch file path exists
if exist "%BATCH_FILE_PATH%" (
    py -m venv .venv
    call .venv\Scripts\activate.bat

    REM Add the current directory to the PATH for the current session
    REM set "DIRECTORY_PATH=%cd%"
    REM set "PATH=%PATH%;%DIRECTORY_PATH%"

    REM setx PATH "%PATH%;%DIRECTORY_PATH%" /M

    REM echo Current directory added to the PATH for the current session.
    echo Installing...
    pip install -r %REQUIREMENTS_PATH%

    REM Run the Streamlit command
    streamlit run %PYTHON_SCRIPT_PATH%

    REM Deactivate the virtual environment
    deactivate

) else (
    echo Batch file not found. Please provide a valid path.
)
