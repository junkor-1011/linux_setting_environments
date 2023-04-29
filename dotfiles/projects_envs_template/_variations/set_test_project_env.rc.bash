# sourceで読み込ませる

_ENV_NAME="miniconda3-4.3.30"
_PROJECT_NAME="test_project"

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR="${SCRIPT_DIR}/../.."   # TMP

export TEST_ENV1="test_project"
export TEST_ENV2="test_environment_variable"
export TEST_ENV3=1
export PROJECT_HOME="${PROJECT_DIR}"
export PYTHON3_PROJECT="$HOME/.pyenv/versions/miniconda3-4.3.30/envs/test_project/bin/python3"
# export SHELL="/usr/bin/fish"
# pyenv shell $_ENV_NAME

# $PYENV_HOME/versions/${_ENV_NAME}/condabin/conda activate ${_PROJECT_NAME}

