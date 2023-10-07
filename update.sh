echo "Cloudreve一键更新脚本"
echo "GitHub开源地址：https://github.com/kyleyh838/CloudreveReplit"
rm -rf cloudreve
releases_url=https://api.github.com/repos/cloudreve/Cloudreve/releases/latest
tag_name=`wget -qO- $releases_url | grep tag_name | cut -f4 -d "\""`
wget -O cloudreve.tar.gz https://github.com/cloudreve/Cloudreve/releases/download/${tag_name}/cloudreve_${tag_name}_linux_amd64.tar.gz
tar -zxvf "cloudreve.tar.gz" --overwrite
rm "cloudreve.tar.gz" "LICENSE" "README.md" "README_zh-CN.md"
echo "完成，已更新至${tag_name}版本!"
echo "点击Run按钮重新启动项目！！！"
