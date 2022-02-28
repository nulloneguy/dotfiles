#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars
echo "---" | tee -a /tmp/bar-main.log
polybar main 2>&1 | tee -a /tmp/bar-main.log & disown

echo "Bars launched..."
