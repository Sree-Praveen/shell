#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir data
# 2. Move the ./rawdata directory to ./data/raw
mv ./rawdata  ./data/raw
# 3. List the contents of the ./data/raw directory
ls ./data/raw
# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
cd ~/shell/02_activities/assignments/data/processed
mkdir server_logs
mkdir user_logs
mkdir event_log
# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
cp ./data/raw/*server*.log  ./data/raw/processed/server_logs
# 6. Repeat the above step for user logs and event logs
cp ./data/raw/*server*.log  ./data/raw/processed/event_logs 
cp ./data/raw/*server*.log  ./data/raw/processed/user_logs 
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rm -f ./data/raw/*ipaddr* 
rm -f ./data/processed/user_logs
# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
touch ./data/inventory.txt


###########################################

echo "Project setup is complete!"

