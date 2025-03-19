#!/usr/bin/env bash
set -euxo pipefail

# get script path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

OS="$(uname -s)"
ARCH="$(uname -m)"

VERSION="$(git ls-remote --tags https://github.com/golang/go.git | awk -F/ '/tags\/go[0-9]+\.[0-9]+\.[0-9]+$/ {gsub(/^go/, "", $NF); print $NF}' | sort -V | tail -n1)"

if [ "$OS" = "Linux" ]; then
    case "$ARCH" in
        x86_64)
            PACKAGE_TGZ="go${VERSION}.linux-amd64.tar.gz"
            ;;
        aarch64)
            PACKAGE_TGZ="go${VERSION}.linux-arm64.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
elif [ "$OS" = "Darwin" ]; then
    case "$ARCH" in
        x86_64)
            PACKAGE_TGZ="go${VERSION}.darwin-amd64.tar.gz"
            ;;
        arm64)
            PACKAGE_TGZ="go${VERSION}.darwin-arm64.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
else
    echo "Unsupported OS: $OS" >&2
    exit 1
fi

INSTALL_PATH="${HOME}/LocalApps"
EXECUTE_PATH="${HOME}/bin"

# Download binary package
curl -LO "https://go.dev/dl/${PACKAGE_TGZ}"

# install (and if exists, remove previous version at /usr/local/go)
rm -rf "${INSTALL_PATH}/go"
tar -C "${INSTALL_PATH}" -xzf "${PACKAGE_TGZ}"

for filepath in "${INSTALL_PATH}/go/bin"/*; do
    array=( $(echo "${filepath}" | tr "/" " ") ) # <- do NOT quote to split (TMP)
    file="${array[$((${#array[@]}-1))]}"

    ln -sfv "${filepath}" "${EXECUTE_PATH}/${file}"
done

# rm package tar.gz file
rm "${PACKAGE_TGZ}"
