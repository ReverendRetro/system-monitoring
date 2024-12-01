#!/bin/bash

# Define log directory and create if it doesn't exist
LOG_DIR="/var/log/monitoring"
mkdir -p "$LOG_DIR"

# Get the current timestamp for the log file name
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Define log file path
LOG_FILE="$LOG_DIR/$TIMESTAMP.log"

# Start logging
{
    # Log LOGGED IN USERS
    echo "USERS LOGGED IN"
    w
    echo

    # Log RAM USAGE
    echo "MEMORY"
    free -mh
    echo
    
    # Log CPU COUNT
    echo "CPU COUNT"
    nproc
    echo

    # Log DISK USAGE
    echo "DISK USAGE"
    df -h
    echo
    
    # Log LOAD AND UPTIME
    echo "LOAD AND UPTIME"
    uptime
    echo
    
    # Log CPU USAGE
    echo "CPU USAGE"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
    echo

    # Log SWAP USAGE
    echo "SWAP USAGE"
    swapon --show
    echo

    # Log INODES USAGE
    echo "INODES USAGE"
    df -i
    echo 

    # Log LOAD AVERAGE (1, 5, and 15 minutes)
    echo "LOAD AVERAGE"
    cat /proc/loadavg
    echo

    # log HIGHEST RAM USING PROCESSES
    echo "PROCESSES RUNNING USING MOST RAM"
    ps aux --sort=-%mem | head -n 10
    echo

    # Log TOP 10 CPU CONSUMING PROCESSES
    echo "TOP 10 CPU CONSUMING PROCESSES"
    ps aux --sort=-%cpu | head -n 10
    echo
    
    # Disk I/O
    echo "DISK I/O"
    iostat -xz 1 1
    echo
    
    # Log TEMPERATURE (CPU and system)
    echo "TEMPERATURE"
    sensors
    echo

    # Log FILESYSTEM ERRORS
    echo "FILESYSTEM ERRORS"
    journalctl -k | grep -i "filesystem" | tail -n 10
    echo

} > "$LOG_FILE"
