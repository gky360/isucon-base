#!/bin/bash

# 引数からファイル名とチャンネル名を取得
channel_name=$1
file_name=$2
message=${3:-}

# 環境変数からトークンを取得
token=$SLACK_TOKEN

# curlコマンドを実行
curl -F file=@"$file_name" -F filename="$file_name" -F "initial_comment=[$(hostname)] $message" -F channels="$channel_name" -H "Authorization: Bearer $token" https://slack.com/api/files.upload > /dev/null
