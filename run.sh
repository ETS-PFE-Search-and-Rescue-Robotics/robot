#!/bin/bash

echo "|---- Killing all running python apps ----|"
sudo killall -9 python

#echo "|---- Launching LiDAR detection in the background ----|"
#ros2 launch ugv_bringup bringup_lidar.launch.py &

echo "|---- Launching Jetson's main program ----|"
XDG_RUNTIME_DIR=/run/user/$(id -u) ~/code-robot/.ugv_env/bin/python ~/code-robot/app.py
