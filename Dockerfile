# Use the official Python image as the base image
FROM python:3.9-slim-bullseye

# Set environment variables
ENV ROBOT_OUTPUT_DIR=/results

# Install necessary system dependencies and Chromium
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    firefox-esr \
    wget \
    unzip \
    xvfb \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libgbm-dev \
    libasound2 \
    libpangocairo-1.0-0 \
    libgtk-3-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Robot Framework and SeleniumLibrary
RUN pip install --no-cache-dir robotframework==6.1.1 robotframework-seleniumlibrary==6.0.0

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . /app

# Expose the default HTTP server port
EXPOSE 7272

# Set the PATH to include Chromium
ENV PATH="/usr/bin:${PATH}"

# Default command to run the HTTP server and execute Robot Framework tests
CMD ["sh", "-c", "python3 demoapp/server.py 7272 & robot --outputdir $ROBOT_OUTPUT_DIR login_tests/"]
