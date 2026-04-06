#!/bin/bash

set -e

# Defining source
source /home/ec2-user/.bash_profile

# Set proper permissions (read/execute for user, nothing for others)
chmod -R 750 /home/ec2-user/git-files/web-app

# Navigating to the web application folder
cd /home/ec2-user/git-files/web-app

# Installing node modules for the web application
npm install --production

# Start web application with logging
nohup node index.js > /var/log/web-app.log 2>&1 &
echo "Application started with PID: $!" 
