#!/bin/sh

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
BASHRC_CONFIG_PATH=.bashrc

help=$(cat << EOS

Usage: sh sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config (~/$BASHRC_CONFIG_PATH)
    import
        - rsync from USER's config (~/$BASHRC_CONFIG_PATH)
    link
        - make symbolic-link at USER's config (~/$BASHRC_CONFIG_PATH)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$BASHRC_CONFIG_PATH ~/$BASHRC_CONFIG_PATH
elif [ "$1" = "import" ]; then
    rsync -auv ~/$BASHRC_CONFIG_PATH ./$BASHRC_CONFIG_PATH
elif [ "$1" = "link" ]; then
    if [ -e ~/$BASHRC_CONFIG_PATH ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$BASHRC_CONFIG_PATH
    fi
    ln -s $(pwd)/$BASHRC_CONFIG_PATH ~/$BASHRC_CONFIG_PATH
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

