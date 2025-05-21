#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: Please login with the root user to continue"
    exit 1
else
    echo "you are running with root access !!!!"
fi

#steps to install mysql

# first we need to check whether it is installed or not

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed....."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Mysql Installation is ..... SUCESS"
    else
        echo "Mysql Installation is ......  FAILURE"
        exit 1
    fi
else
    echo "Mysql is already installed...!!"
fi