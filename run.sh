#!/bin/sh
path=$(cd "$(dirname "$0")"; pwd)
cd $path

sh stop.sh

rm -rf logs/*.*

screen -dmS dev
sleep 1

export NODE_NAME=gate
echo "start "$NODE_NAME"..."
script="export NODE_NAME=${NODE_NAME}"
screen -S dev -X eval "screen" "stuff '${script} && skynet/skynet config/config_gate.lua \n'"

export NODE_NAME=login
echo "start "$NODE_NAME"..."
script="export NODE_NAME=${NODE_NAME}"
screen -S dev -X eval "screen" "stuff '${script} && skynet/skynet config/config_login.lua \n'"


export NODE_NAME=game
echo "start "$NODE_NAME"..."
script="export NODE_NAME=${NODE_NAME}"
screen -S dev -X eval "screen" "stuff '${script} && skynet/skynet config/config_game.lua \n'"
