FROM python:3.11

# Copy only the necessary files into the container
COPY journalctl.py /app/journalctl.py

# Set working directory
WORKDIR /app

# Run the Python script
CMD ["python3", "journalctl.py"]
