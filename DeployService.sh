#!/bin/bash

WORK_PATH=$(dirname $(readlink -f $0))
ENV="local"
PROJECT_NAME=${WORK_PATH##*/}

## 創建 docker network
docker network ls | grep "new_soul_service" >/dev/null 2>&1
    if  [ $? -ne 0 ]; then
        docker network create new_soul_service
    fi

## 啟動 主服務
SERVICE_NAME="soul"
SOUL_DIR=$WORK_PATH/$SERVICE_NAME
cd $SOUL_DIR
echo "ENV=$ENV">.env
echo "PROJECT_NAME=$PROJECT_NAME">>.env
echo "SERVICE_NAME=$SERVICE_NAME">>.env


## 啟動 Auth Service
SERVICE_NAME="auth"
AUTH_DIR=$WORK_PATH/$SERVICE_NAME
cd $AUTH_DIR
echo "ENV=$ENV">.env
echo "PROJECT_NAME=$PROJECT_NAME">>.env
echo "SERVICE_NAME=$SERVICE_NAME">>.env
docker-compose up -d