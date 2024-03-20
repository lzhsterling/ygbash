#!/bin/bash
export LANG=en_US.UTF-8
if [ ! -f yg_update ]; then
echo "请稍等……"
if cat /etc/issue /proc/version /etc/os-release 2>/dev/null | grep -q -E -i "alpine"; then
apk add openssh curl wget bzip2
else
pkg install curl 2>/dev/null
pkg install wget 2>/dev/null
pkg install bzip2 2>/dev/null
pkg update 2>/dev/null
fi
fi
if [ -x "$(command -v bzip2)" ]; then
touch yg_update
rm -rf CFcdnym.sh
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/2CFcdnym.sh -o 2CFcdnym.sh && chmod +x 2CFcdnym.sh
mv 2CFcdnym.sh CFcdnym.sh
bash CFcdnym.sh
else
echo "更新依赖时出错，建议重启SSH客户端。如果依旧如此建议卸载重装SSH客户端"
fi
