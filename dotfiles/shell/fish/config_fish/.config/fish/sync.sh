#!/bin/sh
set -eu

# ToDo: デプロイ用のスクリプトが設定ファイル用ディレクトリに混じっているのはあまり望ましくない
# ToDo: ディレクトリ毎管理するか(`.gitignore`を使う)、`config.fish`のみ使うかは未定
# ToDo: XDG_CONFIG_HOMEは設定されていることを仮定しているが、そうでないような場合も暇だったら考える

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
FISH_CONFIG=config.fish

help=$(cat << EOS

Usage: sh sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config (~/.config/fish/$FISH_CONFIG)
    import
        - rsync from USER's config (~/.config/fish/$FISH_CONFIG)
    link
        - make symbolic-link at USER's config (~/.config/fish/$FISH_CONFIG)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$FISH_CONFIG ~/.config/fish/$FISH_CONFIG
elif [ "$1" = "import" ]; then
    rsync -auv ~/.config/fish/$FISH_CONFIG ./$FISH_CONFIG
elif [ "$1" = "link" ]; then
    if [ -e ~/.config/fish/$FISH_CONFIG ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/.config/fish/$FISH_CONFIG
    fi
    ln -s $(pwd)/$FISH_CONFIG ~/.config/fish/$FISH_CONFIG
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

