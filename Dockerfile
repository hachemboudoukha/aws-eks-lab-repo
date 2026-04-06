# Use an official Ubuntu image as the base
FROM public.ecr.aws/lts/ubuntu:latest

# Set the non-interactive mode for apt to avoid prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install updates and necessary packages
RUN apt-get update && \
    apt-get install -y git curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages
RUN cd web-app && npm install

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV PORT=8000

WORKDIR /app/web-app

# Run app.js using node when the container launches
CMD ["node", "index.js"]
