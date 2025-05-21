#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NONE="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPTNAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started at time: $(date)"|tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo "$RED ERROR:: Login User is not root user acccess denied!!!! $NONE" | tee -a $LOG_FILE
    exit 1
else
    echo "$GREEN Root user login successfully..... $NONE" | tee -a $LOG_FILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo "$2 Installation is ..... $GREEN SUCESS $NONE" | tee -a $LOG_FILE
    else
        echo "$2 Installation is ...... $RED FAILURE $NONE" | tee -a $LOG_FILE
        exit 1
    fi
}
dnf list installed mysql &>>LOG_FILE

if [ $? -ne 0 ]
then
    echo "Mysql is not installed....."
    dnf install mysql -y &>>LOG_FILE
    VALIDATE $? "Mysql"
else
    echo "$YELLOW Mysql is already installed...!!" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>LOG_FILE

if [ $? -ne 0 ]
then
    echo "python3 is not installed....."
    dnf install python3 -y &>>LOG_FILE
    VALIDATE $? "python3"
else
    echo "$YELLOW python3 is already installed...!!" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>LOG_FILE

if [ $? -ne 0 ]
then
    echo "nginx is not installed....."
    dnf install nginx -y &>>LOG_FILE
    VALIDATE $? "nginx"
else
    echo "$YELLOW nginx is already installed...!!" | tee -a $LOG_FILE
fi

