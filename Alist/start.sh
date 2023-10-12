#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

clear
echo "欢迎使用Alist一键搭建&更新脚本"
echo "脚本GitHub开源地址：https://github.com/kyleyh838/ReplitScript"
echo "请选择需要执行的操作:"
echo -e "${green}a. 安装Alist${plain}"
echo -e "${green}b. 更新Alist${plain}"
echo -e "${green}c. 退出脚本${plain}"

read choice

case $choice in
  a)
    echo -e "${yellow}即将安装Alist，请稍等。。。${plain}"
    nix-env -iA nixpkgs.wget
    mkdir build
    cd build
    wget -O .replit https://github.com/kyleyh838/ReplitScript/raw/main/Alist/.replit
    wget -O replit.nix https://github.com/kyleyh838/ReplitScript/raw/main/Alist/replit.nix
    cd ..
    wget -O main.sh https://github.com/kyleyh838/ReplitScript/raw/main/Alist/main.sh
    releases_url=https://api.github.com/repos/kyleyh838/ReplitScript/releases/latest
    tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
    wget -O amd64.tar.gz https://github.com/kyleyh838/ReplitScript/releases/download/${tag_name}/linux-amd64.tar.gz
    tar -zxvf "amd64.tar.gz" --overwrite
    mv alist ast
    rm "amd64.tar.gz"
    cp -r build/.replit . && cp -r build/replit.nix .
    rm -rf build/
    clear
    echo "恭喜安装成功，Alist ${tag_name}"
    echo "点击Run立即运行项目"
    echo "注意保存初始账号密码"
    echo "如忘记密码运行如下命令重置密码"
    echo "./ast admin random"
    exit 0
    ;;
  b)
    echo -e "${yellow}即将更新Alist，请稍等。。。${plain}"
    rm -rf ast
    releases_url=https://api.github.com/repos/kyleyh838/ReplitScript/releases/latest
    tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
    wget -O amd64.tar.gz https://github.com/kyleyh838/ReplitScript/releases/download/${tag_name}/linux-amd64.tar.gz
    tar -zxvf "amd64.tar.gz" --overwrite
    mv alist ast
    rm "amd64.tar.gz"
    clear
    echo "完成，已更新至${tag_name}版本！"
    echo -e "请重新启动项目，${red}Stop-Run${plain} ！！！"
    exit 0
    ;;
  c)
    exit 0
    ;;
  *)
    echo -e "${red}Warning！Warning！Warning！错误选择！即将启动自毁程序引爆设备，请立即将头塞入马桶避免受伤！！！${plain}"
    echo "是否返回主菜单？[y/n]"
    
    read choice1

    case $choice1 in
      y)
        bash <(curl -s https://raw.githubusercontent.com/kyleyh838/ReplitScript/main/Alist/start.sh)
        ;;
      *)
        exit 0
        ;;
    esac
    ;;
esac
