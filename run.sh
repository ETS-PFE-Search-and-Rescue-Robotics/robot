#!/bin/bash

echo "|---- Killing all running python apps ----|"
sudo killall -9 python

echo "|---- Launching Jetson's main program ----|"
XDG_RUNTIME_DIR=/run/user/$(id -u) ~/code-robot-A2026/.ugv_env/bin/python ~/code-robot-A2026/app.py
