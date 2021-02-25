#!/bin/bash

echo "开始执行"
start_=$1
end_=$2
script=$3


if [ ${#start_} != 10 ];then
    echo "ERROR:起始日期格式异常,"${start_}
    exit 1
fi

if  [ ${#end_} != 10 ];then
    echo "ERROR:终止日期格式异常,"${end_}
    exit 1
fi
echo ${start_}
echo ${end_}

start_time=`date -d ${start_} +%s`
end_time=`date -d ${end_} +%s`
echo ${start_time}
echo ${end_time}

if [ ${start_time} -gt ${end_time} ];then
    echo "ERROR:起始时间大于终止时间."
    exit 1
fi

now=${start_time}
while [ ${now} -le ${end_time} ];
do
    echo ${now}
    now_format=$(date -d @${now} "+%Y-%m-%d")
    sh ${script} ${now_format}
    now=`expr ${now} + 86400`
done

echo "任务执行完毕"
