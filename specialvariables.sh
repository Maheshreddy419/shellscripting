#!/bin/bash

echo "print all variables passed to the script: $@"
echo "number of variables passed to the script: $#"
echo "to knoe the script name: $0"
echo "Current Directory: $PWD"
echo "Home directory of the user: $HOME"
echo "to get login user: $USER"
echo "PID of the script: $$"
sleep 10
echo "PID of the backgroung command: $!"