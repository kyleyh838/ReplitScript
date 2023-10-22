!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

clear
echo "欢迎使用Uptime-kuma一键搭建脚本"
echo "脚本GitHub开源地址：https://github.com/kyleyh838/ReplitScript"
echo 
echo -e "${yellow}正在安装Uptime-kuma，请稍等。。。${plain}"
    nix-env -iA nixpkgs.wget
    wget -O .replit https://github.com/kyleyh838/ReplitScript/raw/main/Uptime-kuma/.replit
    npm install npm@9 -g
    git clone https://github.com/louislam/uptime-kuma.git
    cd uptime-kuma
    npm run setup
    echo 
    echo -e "${red}恭喜安装成功\n点击Run立即运行项目${plain}"
    exit 0