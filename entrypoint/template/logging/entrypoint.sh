#!/bin/bash
mkdir -p "$logfile_dir"
timestamp=$(date '+%Y%m%d%H%M%S')
logfile="${logfile_dir}/log_${timestamp}.txt"
log() {
        #echo "[INFO] $1"
        echo "[INFO] $*" | tee -a "$logfile"
}

log "${test}"

# Keep the container alive
tail -f /dev/null

