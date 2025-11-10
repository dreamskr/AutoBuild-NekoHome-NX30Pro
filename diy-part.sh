#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# change default ip to 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate 

# Modify Default Hostname
sed -i 's/ImmortalWrt/NekoHome/g' package/base-files/files/bin/config_generate

# Modify Default Timezone 
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# Modify Default mtwifi-cfg WiFi SSID
sed -i 's/ImmortalWrt-2.4G/NekoHome/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/NekoHome-5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# Modify Default Software Source
sed -i 's/mirrors.vsean.net\/openwrt/mirrors.pku.edu.cn\/immortalwrt/g' package/emortal/default-settings/files/99-default-settings-chinese

# Replace Banner
cp -f $GITHUB_WORKSPACE/banner package/base-files/files/etc/banner

# Theme
# luci-theme-neobird
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird.git package/otherapp/luci-theme-neobird

# Mentohust
git clone --depth 1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/otherapp/mentohust

# UnblockNeteaseMusic
git clone --depth 1 -b master  https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/unblockneteasemusic

# iStore
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# add feed
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default

