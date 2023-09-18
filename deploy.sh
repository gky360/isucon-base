#!/bin/bash
set -eux

cd

git diff --exit-code > /dev/null
GIT_REVISION=$(git rev-parse --short HEAD)

date -R
./dotfiles/scripts/slack.sh isucon ":arrow_forward: \`${GIT_REVISION}\` Started deploying."

finally() {
  ret=$?

  date -R
  if [ $ret -eq 0 ]; then
    ./dotfiles/scripts/slack.sh isucon ":white_check_mark: \`${GIT_REVISION}\` Finished deploying."
  else
    ./dotfiles/scripts/slack.sh isucon ":large_red_square: \`${GIT_REVISION}\` Failed to deploy."
  fi

  exit $ret
}
trap finally EXIT

# rotate logs
function rotate_log () {
  if sudo [ -e $1 ]; then
    sudo mv $1 ${1%.*}_bak.${1##*.}
  fi
}
rotate_log /var/log/nginx/access.log
rotate_log /var/log/nginx/error.log
rotate_log /var/log/mysql/slow.log


# build go app
pushd $APP_DIR
$APP_BUILD_CMD
popd

# update mysqld.cnf
if [ -e ~/etc/mysql/mysqld.cnf ]; then
  sudo cp ~/etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
fi

# restart services
sudo systemctl restart mysql
sudo systemctl restart $APP_SERVICE_NAME
sudo systemctl restart nginx
