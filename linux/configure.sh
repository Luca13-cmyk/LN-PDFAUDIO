#!/bin/bash

# Install espeak and ffmpeg
sudo apt-get update
sudo apt-get install -y espeak ffmpeg

# Create a virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install any additional Python packages you may need within the virtual environment

pip3 install -r ../requirements.txt

# Display a message indicating successful setup
echo "Setup complete. Virtual environment activated."

# Your additional commands or scripts can be added here within the activated virtual environment

# To deactivate the virtual environment, use the command: deactivate
#chmod +x ln-pdfaudio.sh
#sudo ln -sf "$(realpath ln-pdfaudio.sh)" /usr/bin/ln-pdfaudio
echo "run: ln-pdfaudio.sh"
ln-pdfaudio