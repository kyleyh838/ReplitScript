echo "Cloudreve一键搭建脚本"
echo "GitHub开源地址：https://github.com/kyleyh838/CloudreveReplit"
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
echo "恭喜搭建完成"
echo "Cloudreve ${tag_name}"
echo "点击Run立即运行项目"
echo "请注意保存初始账号密码"
