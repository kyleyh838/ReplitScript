#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

clear
echo "欢迎使用Cloudreve一键搭建&更新脚本"
echo "脚本GitHub开源地址：https://github.com/kyleyh838/CloudreveReplit"
echo "请选择需要执行的操作:"
echo "${green}a. 安装Cloudreve${plain}"
echo "${green}b. 更新Cloudreve${plain}"
echo "${green}c. 退出脚本${plain}"

read choice

case $choice in
  a)
    echo "${yellow}即将安装Cloudreve，请稍等。。。${plain}"
    nix-env -iA nixpkgs.wget
    mkdir build
    cd build
    wget -O .replit https://github.com/kyleyh838/CloudreveReplit/raw/main/.replit
    wget -O replit.nix https://github.com/kyleyh838/CloudreveReplit/raw/main/replit.nix
    cd ..
    wget -O main.sh https://github.com/kyleyh838/CloudreveReplit/raw/main/main.sh
    releases_url=https://api.github.com/repos/cloudreve/Cloudreve/releases/latest
    tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
    wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/${tag_name}/cloudreve_${tag_name}_linux_amd64.tar.gz
    tar -zxvf "cloudreve.tar.gz" --overwrite
    rm "cloudreve.tar.gz" "LICENSE" "README.md" "README_zh-CN.md"
    cp -r build/.replit . && cp -r build/replit.nix .
    rm -rf build/
    clear
    echo "恭喜安装成功，Cloudreve ${tag_name}"
    echo "点击Run立即运行项目"
    echo "请注意保存初始账号密码"
    exit 0
    ;;
  b)
    echo "${yellow}即将更新Cloudreve，请稍等。。。${plain}"
    rm -rf cloudreve
    releases_url=https://api.github.com/repos/cloudreve/Cloudreve/releases/latest
    tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
    wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/${tag_name}/cloudreve_${tag_name}_linux_amd64.tar.gz
    tar -zxvf "cloudreve.tar.gz" --overwrite
    rm "cloudreve.tar.gz" "LICENSE" "README.md" "README_zh-CN.md"
    clear
    echo "完成，已更新至${tag_name}版本！"
    echo "请重新启动项目，${red}Stop-Run${plain} ！！！"
    exit 0
    ;;
  c)
    exit 0
    ;;
  *)
    echo "${red}Warning！Warning！Warning！错误选择！即将启动自毁程序引爆设备，请立即将头塞入马桶避免受伤！！！${plain}"
    echo "是否返回主菜单？[y/n]"
    
    read choice1

    case $choice1 in
      y)
        bash <(curl -s https://raw.githubusercontent.com/kyleyh838/CloudreveReplit/master/start.sh)
        ;;
      *)
        exit 0
        ;;
    esac
    ;;
esac
