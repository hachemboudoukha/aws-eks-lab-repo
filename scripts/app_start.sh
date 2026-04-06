#!/bin/bash

# Defining source
source /home/ec2-user/.bash_profile

# Providing complete permissions to the project folder
sudo chmod -R 777 /home/ec2-user/git-files/web-app

# Navigating to the web application folder
cd /home/ec2-user/git-files/web-app

# Installing node modules for the web application
npm install

# Starting web application in the background
nohup node index.js > /dev/null 2>&1 & 
