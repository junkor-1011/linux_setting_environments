
SCRIPT_DIR=$(cd $(dirname $0); pwd)

if type fzf > /dev/null 2>&1; then
  source ${SCRIPT_DIR}/udf/fzf.zsh
fi
