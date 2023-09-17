#!/bin/bash
set -eux

# 各種インストール
sudo apt update -y
sudo apt install -y --fix-missing htop unzip graphviz

# netdata
sudo apt install -y autoconf-archive zlib1g-dev uuid-dev libmnl-dev libuv1-dev liblz4-dev libssl-dev libjudy-dev
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait

# alp
wget https://github.com/tkuchiki/alp/releases/download/v1.0.11/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install ./alp /usr/local/bin
rm alp_linux_amd64.zip alp

curl -L https://raw.githubusercontent.com/gky360/isucon-base/master/alp.yml -o ~/alp.yml

# percona-toolkit
wget percona.com/get/pt-query-digest
sudo install ./pt-query-digest /usr/local/bin
rm pt-query-digest

# slack.sh
curl -L https://raw.githubusercontent.com/gky360/isucon-base/master/slack.sh -o ~/slack.sh
chmod +x ~/slack.sh
