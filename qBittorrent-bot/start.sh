#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

clear
echo "欢迎使用qBittorrent-bot一键搭建脚本"
echo "脚本GitHub开源地址：https://github.com/kyleyh838/ReplitScript"
echo "请选择需要执行的操作:"
echo -e "${green}1. 安装qBittorrent-bot${plain}"
echo -e "${green}0. 退出脚本${plain}"

read choice

case $choice in
  1)
    echo -e "${yellow}正在安装qBittorrent-bot，请稍等。。。${plain}"
    nix-env -iA nixpkgs.wget
    wget -O .replit https://github.com/kyleyh838/ReplitScript/raw/main/qBittorrent-bot/.replit
    wget -O replit.nix https://github.com/kyleyh838/ReplitScript/raw/main/qBittorrent-bot/replit.nix
    wget -O qbot.tar https://github.com/kyleyh838/ReplitScript/releases/download/qbot/qbittorrent-bot-zh.tar
    tar -xf "qbot.tar" --overwrite
    rm "qbot.tar"
    cp config.example.toml config.toml
    clear
    echo -e "${yellow}请输入TG-BOT Token：${plain}"
    read bot_token
    echo -e "${green}请输入管理员TG-ID：${plain}"
    read tg_id
    echo -e "${yellow}请输入qBit-WebUI完整地址：\n格式示例：http://127.0.0.1:8888/${plain}"
    read ui_addr
    echo -e "${green}请输入qBit用户名：${plain}"
    read qb_user
    echo -e "${yellow}请输入qBit密码：${plain}"
    read qb_passwd
    file_to_edit="./config.toml"
    echo "[telegram]
token = \"${bot_token}\"
admins = [${tg_id}]
workers = 1 # number of python-telegram-bot workers. One worker is more than enough
timeout = 120 # requests timeout in seconds
errors_log_chat = 0 # chat where to post exceptions. If disabled (0), the first user id in 'admins' will be used

[proxy]
url = \"\"        # socks5(h)://ip:port or http://user:pass@ip:port/
username = \"\"   # Socks only, Use url embeded user/pass for http(s)
password = \"\"   # Socks only

[notifications]
completed_torrents = 0 # id of a chat to notify when a torrent is completed. 0 to disable
no_notification_tag = \"\" # if a torrent has this tag, do not send the completed download notification in the notifications chat (if set). Case insensitive. \"\" (empty string) to disable
added_torrents = 0 # id of a chat to notify when a new torrent is added. 0 to disable

[qbittorrent]
url = \"${ui_addr}\"
# for docker user the url should not be 127.0.0.1 because the container is connected to docker0 network
# url = \"http://172.17.0.1:8080\" # docker0 network, the 172.0.0.1 is host ip addr
login = \"${qb_user}\"
secret = \"${qb_passwd}\"
added_torrents_tag = \"\" # a tag to add to the torrents added through the bot. \"\" (empty string) to disable
added_torrents_category = \"\" # the category to set for torrents added through the bot. \"\" (empty string) to disable
altspeed_presets = [
    # alternative speed buttons (in kb/s) to show when /overview is used. Set this to [] (empty list) to show no altspeed button
    # [upload, download],
    [5, 10],
    [5, 50],
    [5, 200],
]
" > "$file_to_edit"
    pip install -r requirements.txt
    clear
    echo "恭喜安装成功"
    echo "点击Run立即运行项目"
    echo -e "${red}首次运行需安装依赖库，用时较长请耐心等待！${plain}"
    echo "TG-Bot输入/help查看指令"
    exit 0
    ;;
  0)
    echo "已退出脚本，期待你的再次使用！"
    exit 0
    ;;
  *)
    echo -e "${red}Warning！Warning！Warning！错误选择！即将启动自毁程序引爆设备，请立即将头塞入马桶避免受伤！！！${plain}\n是否返回主菜单？[y/n]:"
    
    read choice1

    case $choice1 in
      y|Y)
        bash <(curl -s https://raw.githubusercontent.com/kyleyh838/ReplitScript/main/qBittorrent-bot/start.sh)
        ;;
      *)
        exit 0
        ;;
    esac
    ;;
esac