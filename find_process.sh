#!/bin/bash
BASE_DIR=$(pwd)
export env=test
ADMIN_CONFIG="./admin-server/conf/config_${env}.xml"
ADMIN_LOG="./log/$(date +%Y%m%d)_admin_server.log"
ADMIN_PID=$(ps -ef | grep -w ./admin-server/admin_server | grep -v grep | awk '{print $2}' | tr "\n" " ")

#关掉正在运行中的服务
stopServers(){
    kill -s 9 ${ADMIN_PID} 
}

startServers(){
    cd $BASE_DIR
    nohup ./admin-server/admin_server -config=${ADMIN_CONFIG} >>${ADMIN_LOG}  2>&1 &
    if [[ $? -ne 0 ]]; then
      echo "admin_server启动失败"
      exit
    else
        echo "admin_server部署完毕"
    fi
}

monitorServers(){
    while [[ 1 -eq 1 ]]  #死循环
    do
        if [[ ${ADMIN_PID} -ne 0 ]]; then
            echo "admin_server running..."
        else
             echo "admin_server not found !!"
        fi
        sleep 5
    done
}


case "$1" in
    start)
        startServers
        ;;
    stop)
        stopServers
        ;;
    monitor)
        monitorServers
        ;;
    restart)
        stopServers
        startServers
        ;;
    *)
       echo "usage: $0 start|stop|restart|monitor" >&2
       exit 1
       ;;
esac






