#!/usr/bin/env bash

LOCK_FILE="/tmp/build.lock"
HOME="/root/portfolio"

cat /etc/ssh/sshd_config >> "$HOME/logs/heal-deploy.log" 2>&1
sleep 1s

sed -i '/^UsePAM/c\UsePAM yes' /etc/ssh/sshd_config
cat /etc/ssh/sshd_config >> "$HOME/logs/heal-deploy.log" 2>&1


#flock -n $LOCK_FILE -c "bash $HOME/portfolio/scripts/deploy_if_changed.sh" >> "$HOME/logs/portfolio.log" 2>&1
