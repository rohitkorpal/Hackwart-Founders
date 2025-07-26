# Use lightweight Python image
FROM python:3.10-slim

# Install OS-level dependencies for OpenCV + YOLO
RUN apt-get update && \
    apt-get install -y libgl1 libglib2.0-0 ffmpeg && \
    apt-get clean

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files
COPY . /app
WORKDIR /app

# Run the Streamlit app on Render-compatible host/port
CMD ["streamlit", "run", "main2.py", "--server.port=8000", "--server.address=0.0.0.0"]
