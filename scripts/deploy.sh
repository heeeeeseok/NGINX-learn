#!/bin/bash
BUILD_JAR=$(ls /home/ubuntu/NGINX-learn/build/libs/*.jar)
JAR_NAME=$(basename $BUILD_JAR)
DEPLOY_LOG=/home/ubuntu/NGINX-learn/deploy.log
ERROR_LOG=/home/ubuntu/NGINX-learn/error.log

echo "> build 파일명: $JAR_NAME" >> $DEPLOY_LOG

echo "> build 파일 복사" >> $DEPLOY_LOG
DEPLOY_PATH=/home/ubuntu/NGINX-learn/
cp $BUILD_JAR $DEPLOY_PATH

echo "> 현재 실행중인 pid 확인" >> $DEPLOY_LOG
CURRENT_PID=$(pgrep -f $JAR_NAME)

if [ -z $CURRENT_PID ]
then
  ehco "> 현재 구동중인 서버가 없음" >> $DEPLOY_LOG
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "> DEPLOY_JAR 배포" >> $DEPLOY_LOG
nohup java -jar $DEPLOY_JAR > $DEPLOY_LOG 2> $ERROR_LOG &