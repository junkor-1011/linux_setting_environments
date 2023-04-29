#!/usr/bin/env sh
set -eu

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
TERN_CONFIG_FILENAME=.tern-config
ESLINT_CONFIG_FILENAME=.eslintrc
STYLELINT_CONFIG_FILENAME=.stylelintrc

help=$(cat << EOS

Usage: bash sync.sh <arg>
<arg>:
    deploy
        - rsync to USER's config (~/$TERN_CONFIG_FILENAME)
    import
        - rsync from USER's config (~/$TERN_CONFIG_FILENAME)
    link
        - make symbolic-link at USER's config (~/$TERN_CONFIG_FILENAME)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$TERN_CONFIG_FILENAME ~/$TERN_CONFIG_FILENAME
    rsync -auv ./$ESLINT_CONFIG_FILENAME ~/$ESLINT_CONFIG_FILENAME
    rsync -auv ./$STYLELINT_CONFIG_FILENAME ~/$STYLELINT_CONFIG_FILENAME
elif [ "$1" = "import" ]; then
    rsync -auv ~/$TERN_CONFIG_FILENAME ./$TERN_CONFIG_FILENAME
    rsync -auv ~/$ESLINT_CONFIG_FILENAME ./$ESLINT_CONFIG_FILENAME
    rsync -auv ~/$STYLELINT_CONFIG_FILENAME ./$STYLELINT_CONFIG_FILENAME
elif [ "$1" = "link" ]; then
    # tern
    if [ -e ~/$TERN_CONFIG_FILENAME ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$TERN_CONFIG_FILENAME
    fi
    ln -s $(pwd)/$TERN_CONFIG_FILENAME ~/$TERN_CONFIG_FILENAME

    # eslint
    if [ -e ~/$ESLINT_CONFIG_FILENAME ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$ESLINT_CONFIG_FILENAME
    fi
    ln -s $(pwd)/$ESLINT_CONFIG_FILENAME ~/$ESLINT_CONFIG_FILENAME

    # stylelint
    if [ -e ~/$STYLELINT_CONFIG_FILENAME ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$STYLELINT_CONFIG_FILENAME
    fi
    ln -s $(pwd)/$STYLELINT_CONFIG_FILENAME ~/$STYLELINT_CONFIG_FILENAME
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

