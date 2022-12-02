#!/bin/bash

WORK_PATH=$(dirname $(readlink -f $0))
ENV="local"

## 創建 docker network
docker network ls | grep "new_soul_service" >/dev/null 2>&1
    if  [ $? -ne 0 ]; then
        docker network create new_soul_service
    fi

## 啟動 主服務
PROJECT_NAME="soul"
SOUL_DIR=$WORK_PATH/$PROJECT_NAME
cd $SOUL_DIR
echo "ENV=$ENV">.env
echo "PROJECT_NAME=$PROJECT_NAME">>.env



## 啟動 Auth Service
PROJECT_NAME="auth"
AUTH_DIR=$WORK_PATH/$PROJECT_NAME
cd $AUTH_DIR
echo "ENV=$ENV">.env
echo "PROJECT_NAME=$PROJECT_NAME">>.env