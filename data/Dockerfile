# Use a lightweight base image
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install PostgreSQL client and other necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the bash script into the container
COPY get_data.sh /usr/local/bin/get_data.sh

# Make the script executable
RUN chmod +x /usr/local/bin/get_data.sh

# Set the entrypoint to execute the bash script
ENTRYPOINT ["/usr/local/bin/get_data.sh"]