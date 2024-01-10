#!/bin/bash

# Activate the virtual environment
source .venv/bin/activate

# Execute ln-pdfaudio.py
streamlit run ../ln-pdfaudio.py

# Deactivate the virtual environment
deactivate