# Use an official Python image as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# --- TESSERACT INSTALLATION WITH DETAILED LOGS ---
# Add echo statements to track progress in Render's build logs.
RUN echo "--- STEP 1: Updating package lists ---" && \
    apt-get update && \
    echo "--- STEP 2: Installing Tesseract OCR ---" && \
    apt-get install -y tesseract-ocr && \
    echo "--- STEP 3: Verifying Tesseract installation ---" && \
    tesseract --version && \
    echo "--- STEP 4: Cleaning up package lists ---" && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN echo "--- STEP 5: Installing Python libraries ---" && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# The command to run when the container launches.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
