#!/bin/sh

## 克隆monk-coder仓库
if [ ! -d "/monk/" ]; then
    echo "未检查到monk-coder仓库脚本，初始化下载相关脚本..."
    git clone https://github.com/monk-coder/dust /monk
else
    echo "更新monk-coder脚本相关文件..."
    git -C /monk reset --hard
    git -C /monk pull origin main --rebase
fi
cp -f /monk/car/*_*.js /scripts
cp -f /monk/i-chenzhe/*_*.js /scripts
cp -f /monk/member/*_*.js /scripts
cp -f /monk/normal/*_*.js /scripts

## 合并monk&i-chenzhe大师脚本进入crontab列表
cat /monk/i-chenzhe/remote_crontab_list.sh /monk/remote_crontab_list.sh >> /scripts/docker/merged_list_file.sh
