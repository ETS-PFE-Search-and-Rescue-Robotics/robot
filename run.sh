#!/bin/bash

echo "|---- Killing all running python apps ----|"
sudo killall -9 python

echo "|---- Launching Jetson's main program ----|"
XDG_RUNTIME_DIR=/run/user/$(id -u) ~/code-robot/.ugv_env/bin/python ~/code-robot/app.py
