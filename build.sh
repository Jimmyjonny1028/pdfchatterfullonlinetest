#!/usr/bin/env bash
# exit on error
set -o errexit
# Print every command as it runs for detailed debugging
set -x

# Ensure the script is executable
chmod +x build.sh

# Install system dependencies for OCR
echo "--- STEP 1: Installing Tesseract OCR ---"
apt-get update && apt-get install -y tesseract-ocr

# Verify Tesseract installation
echo "--- STEP 2: Verifying Tesseract installation ---"
tesseract --version

# Install Python dependencies
echo "--- STEP 3: Installing Python libraries ---"
pip install -r requirements.txt

echo "--- BUILD SCRIPT FINISHED ---"
