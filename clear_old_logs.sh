#!/bin/bash

# Define the log directory
LOG_DIR="/var/log/monitoring"

# Find and delete files older than 3 days
find "$LOG_DIR" -type f -mtime +3 -exec rm -f {} \;
