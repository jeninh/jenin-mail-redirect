# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
# Note: --trusted-host flags may be needed in certain environments with SSL issues
# Remove these flags if you're in a normal environment for better security
RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

# Copy application code
COPY app.py .

# Expose port 5000
EXPOSE 5000

# Run the application with Gunicorn for production
# Using 2 workers for better handling of concurrent requests
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
