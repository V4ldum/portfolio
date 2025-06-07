#!/usr/bin/env bash

LOCK_FILE="/tmp/build.lock"
HOME="/root/portfolio"
flock -n $LOCK_FILE -c "bash $HOME/portfolio/scripts/deploy_if_changed.sh" >> "$HOME/logs/portfolio.log" 2>&1
