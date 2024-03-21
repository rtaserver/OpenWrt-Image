#!/bin/bash

sed -i "s/luci-theme-bootstrap/luci-theme-$WRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

CFG_FILE="./package/base-files/files/bin/config_generate"

sed -i "s/192\.168\.[0-9]*\.[0-9]*/$WRT_IP/g" $CFG_FILE

sed -i "s/hostname='.*'/hostname='$WRT_NAME'/g" $CFG_FILE

sed -i "s/timezone='.*'/timezone='CST-8'/g" $CFG_FILE
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Jakarta'" $CFG_FILE


echo "CONFIG_PACKAGE_luci-theme-$WRT_THEME=y" >> ./.config
echo "CONFIG_PACKAGE_luci-app-$WRT_THEME-config=y" >> ./.config

echo "CONFIG_PACKAGE_luci-app-openclash=y" >> ./.config
