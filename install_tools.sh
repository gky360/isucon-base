#!/bin/bash
set -eux

case $(uname -p) in
  aarch64)
    ARCH="arm64"
    ;;
  *)
    ARCH="amd64"
    ;;
esac

# 各種インストール
sudo apt update -y
sudo apt install -y --fix-missing htop unzip graphviz

# netdata
sudo apt install -y autoconf-archive zlib1g-dev uuid-dev libmnl-dev libuv1-dev liblz4-dev libssl-dev libjudy-dev
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait

# alp
wget https://github.com/tkuchiki/alp/releases/download/v1.0.11/alp_linux_${ARCH}.zip
unzip alp_linux_${ARCH}.zip
sudo install ./alp /usr/local/bin
rm alp_linux_${ARCH}.zip alp

# percona-toolkit
wget percona.com/get/pt-query-digest
sudo install ./pt-query-digest /usr/local/bin
rm pt-query-digest

