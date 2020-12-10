#!/bin/bash

# -auth guess 
x11vnc -forever -loop -noxdamage -repeat -rfbauth /root/.vnc/passwd -rfbport 5900 -shared
