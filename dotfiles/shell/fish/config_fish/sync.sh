#!/bin/sh
set -eu

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
FISH_CONFIG_PATH=.config/fish

help=$(cat << EOS

Usage: bash sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config dir (~/$FISH_CONFIG_PATH)
    import
        - rsync from USER's config dir (~/$FISH_CONFIG_PATH)
    link
        - make symbolic-link at USER's config dir (~/$FISH_CONFIG_PATH)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$FISH_CONFIG_PATH/ ~/$FISH_CONFIG_PATH/
elif [ "$1" = "import" ]; then
    rsync -auv ~/$FISH_CONFIG_PATH/ ./$FISH_CONFIG_PATH/
elif [ "$1" = "link" ]; then
    # if [ -e ~/$FISH_CONFIG_PATH ]; then
    #     # はじめからsymbolic linkで管理していることを前提
    #     # 時間があったらファイルタイプに応じて処理を分岐させるかも
    #     unlink ~/$FISH_CONFIG_PATH
    # fi
    if [ -d ~/$FISH_CONFIG_PATH ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        mv ~/$FISH_CONFIG_PATH ~/${FISH_CONFIG_PATH}_bk_$(date '+%Y-%m-%dT%T')
    fi
    ln -sfnv $(pwd)/$FISH_CONFIG_PATH ${HOME}/$FISH_CONFIG_PATH
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

