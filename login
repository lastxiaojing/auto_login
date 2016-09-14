#!/bin/bash

# 检查参数
if [ $# -ne 1 ]; then
	echo "<./login IpAddr>"
	exit
fi

# 机器地址简写
IPLIST=(
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
)
# 机器IP地址
iplist=(
	"root@x.x.x.x"
	"root@x.x.x.x"
	"root@x.x.x.x"
	"root@x.x.x.x"
	"root@x.x.x.x"
	"root@x.x.x.x"
)
# 对应机器密码
pdlist=(
	"abcd"
	"abcd"
	"abcd"
	"abcd"
	"abcd"
	"abcd"
)
# 获取参数 IP的简写
ip=$1
# IP
ipaddr=""
# PASSWD
ippwd=""
# 获取列表长度，
ipcnt=${#IPLIST[@]}

# 在列表中检查, 有则获取对应密码
for ((i=0; i<$ipcnt; i++)); do
	if [ $ip = ${IPLIST[$i]} ]; then
		ipaddr=${iplist[$i]};
		ippwd=${pdlist[$i]};
		break;
	fi
done

# 列表中没有此IpAddr
if [ -z $ipaddr ]; then
	echo "No this IpAddr in the dict!"
fi
if [ -z $ippwd ]; then
	echo "No this IpAddr in the dict!"
fi

# 添加换行
# ippwd=${ippwd}"\r"

# 登录 调用脚本loginIp
./loginIp $ipaddr $ippwd
