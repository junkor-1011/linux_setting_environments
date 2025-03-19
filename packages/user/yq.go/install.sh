#!/usr/bin/env bash
set -euxo pipefail

# get script path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

OS="$(uname -s)"
ARCH="$(uname -m)"

VERSION="$(curl --silent "https://api.github.com/repos/mikefarah/yq/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')"

INSTALL_PATH="${HOME}/LocalApps"
EXECTIVE_PATH="${HOME}/bin"

# PKG="yq_${OS}_${CPU_ARCH}"
if [ "$OS" = "Linux" ]; then
    case "$ARCH" in
        x86_64)
            PKG="yq_linux_amd64"
            ;;
        aarch64)
            PKG="yq_linux_arm64"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
elif [ "$OS" = "Darwin" ]; then
    case "$ARCH" in
        x86_64)
            PKG="yq_darwin_amd64"
            ;;
        arm64)
            PKG="yq_darwin_arm64"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
else
    echo "Unsupported OS: $OS" >&2
    exit 1
fi

DOWNLOAD_URL="https://github.com/mikefarah/yq/releases/download/v${VERSION}/${PKG}"

WORK_DIR="__TMP__"
if [ -d "${WORK_DIR}" ]; then
    rm -rf "${WORK_DIR}"
fi
mkdir "${WORK_DIR}"
cd "${WORK_DIR}"
curl -LO "${DOWNLOAD_URL}"
chmod +x "${PKG}"
mv "${PKG}" "${INSTALL_PATH}/yq"
ln -sfv "${INSTALL_PATH}/yq" "${EXECTIVE_PATH}/yq-go"
ln -sfv "${INSTALL_PATH}/yq" "${EXECTIVE_PATH}/gyq"

# cleanup
cd ..
rm -rf "${WORK_DIR}"

echo "yq(go) v${VERSION} has been installed."
