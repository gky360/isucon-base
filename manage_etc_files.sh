#!/bin/bash
set -eux

# nginx
mkdir -p ~/etc/nginx
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.org
sudo mv /etc/nginx/nginx.conf ~/etc/nginx/nginx.conf
sudo chmod 666 ~/etc/nginx/nginx.conf
sudo chown isucon:isucon ~/etc/nginx/nginx.conf
sudo ln -s ~/etc/nginx/nginx.conf /etc/nginx/nginx.conf

# mysql
mkdir -p ~/etc/mysql
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.org
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf ~/etc/mysql/
sudo chmod 666 ~/etc/mysql/mysqld.cnf
sudo chown isucon:isucon ~/etc/mysql/mysqld.cnf

# sysctl
sudo cp /etc/sysctl.conf /etc/sysctl.conf.org
sudo mv /etc/sysctl.conf ~/etc/sysctl.conf
sudo chmod 666 ~/etc/sysctl.conf
sudo chown isucon:isucon ~/etc/sysctl.conf
sudo ln -s ~/etc/sysctl.conf /etc/sysctl.conf
