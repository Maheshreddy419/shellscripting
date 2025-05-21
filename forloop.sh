#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NONE="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPTNAME.log"
PACKAGES=("mysql" "nginx" "httpd" "python")

mkdir -p $LOGS_FOLDER
echo "Script started at time: $(date)"|tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo -e "${RED} ERROR:: Login User is not root user acccess denied!!!! ${NONE}" | tee -a $LOG_FILE
    exit 1
else
    echo -e "${GREEN} Root user login successfully..... ${NONE}" | tee -a $LOG_FILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e "$2 Installation is ..... ${GREEN} SUCESS ${NONE}" | tee -a $LOG_FILE
    else
        echo -e "$2 Installation is ...... ${RED} FAILURE ${NONE}" | tee -a $LOG_FILE
        exit 1
    fi
}

for package in {PACKAGES[@]}
do
    dnf list installed $package &>>LOG_FILE

    if [ $? -ne 0 ]
    then
        echo "$package is not installed....."
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "${YELLOW} $package is already installed...!! ${NONE}" | tee -a $LOG_FILE
    fi  
done

# dnf list installed mysql &>>LOG_FILE

# if [ $? -ne 0 ]
# then
#     echo "Mysql is not installed....."
#     dnf install mysql -y &>>LOG_FILE
#     VALIDATE $? "Mysql"
# else
#     echo -e "${YELLOW} Mysql is already installed...!! ${NONE}" | tee -a $LOG_FILE
# fi

# dnf list installed python3 &>>LOG_FILE

# if [ $? -ne 0 ]
# then
#     echo "python3 is not installed....."
#     dnf install python3 -y &>>LOG_FILE
#     VALIDATE $? "python3"
# else
#     echo -e "${YELLOW} python3 is already installed...!! ${NONE}" | tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>LOG_FILE

# if [ $? -ne 0 ]
# then
#     echo "nginx is not installed....."
#     dnf install nginx -y &>>LOG_FILE
#     VALIDATE $? "nginx"
# else
#     echo -e "${YELLOW} nginx is already installed...!! ${NONE}" | tee -a $LOG_FILE
# fi

