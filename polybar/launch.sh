#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# (sleep 2; polybar -r main) &

if type "xrandr"; then
	  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		      MONITOR=$m polybar --reload main &
		        done
		else
			  polybar --reload main &
fi

echo "Polybar launched..."
