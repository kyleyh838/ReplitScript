#!/bin/bash

clear
echo "欢迎使用Cloudreve一键搭建&更新脚本"
echo "脚本GitHub开源地址：https://github.com/kyleyh838/CloudreveReplit"
echo "请选择需要执行的操作:"
echo "a. 安装Cloudreve"
echo "b. 更新Cloudreve"
echo "c. 退出脚本"

read choice

case $choice in
  a)
    echo "即将安装Cloudreve，请稍等。。。"
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
    ;;
  b)
    echo "即将更新Cloudreve，请稍等。。。"
    rm -rf cloudreve
    releases_url=https://api.github.com/repos/cloudreve/Cloudreve/releases/latest
    tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
    wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/${tag_name}/cloudreve_${tag_name}_linux_amd64.tar.gz
    tar -zxvf "cloudreve.tar.gz" --overwrite
    rm "cloudreve.tar.gz" "LICENSE" "README.md" "README_zh-CN.md"
    clear
    echo "完成，已更新至${tag_name}版本！"
    echo "请重新启动项目，Stop-Run ！！！"
    ;;
  c)
    exit 0
    ;;
  *)
    echo "Warning！Warning！Warning！错误选择！即将启动自毁程序引爆设备，请立即将头塞入马桶避免受伤！！！"
    echo "输入1返回主菜单，退出脚本输入任意字符"
    
    read choice1

    case $choice1 in
      1)
        bash <(curl -s https://raw.githubusercontent.com/kyleyh838/CloudreveReplit/master/start.sh)
        ;;
      *)
        exit 0
        ;;
    esac
    ;;
esac
