#!/bin/bash
DEPLOY_SH=/home/ubuntu/NGINX-learn/scripts/deploy.sh
APPLICATION_LOG=/home/ubuntu/NGINX-learn/application.log
ERROR_LOG=/home/ubuntu/NGINX-learn/error.log

sh $DEPLOY_SH > $APPLICATION_LOG 2> $ERROR_LOG &