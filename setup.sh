#!/bin/bash

# Define the URL of the zip file (GitHub Releases)
URL="https://github.com/stevenshci/PupilSense/releases/download/v1.0/models.zip"

echo "Downloading model from GitHub Releases..."
wget -O models.zip $URL || curl -L -o models.zip $URL

echo "Extracting files..."
unzip -o models.zip

echo "Cleanup downloaded zip file..."
rm -f models.zip

python3 -m pip install pyyaml setuptools

# Copy example.env to .env if it doesn't already exist
if [ ! -f .env ]; then
    cp example.env .env
    echo "Created .env file. Please configure it with your specific settings."
else
    echo ".env file already exists. Please ensure it has the correct settings."
fi

# Clone & Install Detectron2
if [ ! -d "detectron2" ]; then
    git clone https://github.com/facebookresearch/detectron2.git
fi
python3 -m pip install -e detectron2

echo "Setup completed successfully."

