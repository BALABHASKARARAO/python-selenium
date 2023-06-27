FROM python:3.10.6-alpine

# Install necessary packages
RUN apk update \
    && apk add --no-cache \
        chromium \
        chromium-chromedriver \
        xvfb \
        wait4ports \
        xorg-server \
        dbus \
        ttf-freefont \
        mesa-dri-swrast \
        udev \
        && rm -rf /var/lib/apt/lists/*

# Set up environment variables
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Copy test script to the container
COPY test_script.py /

# Install Selenium package
RUN pip install selenium

# Set up entry point
CMD ["python", "/test_script.py"]
