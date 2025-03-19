#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR" || exit 1

OS="$(uname -s)"
ARCH="$(uname -m)"

VERSION="$(curl --silent "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')"

echo "install fzf ..."
echo "OS: ${OS}, ARCH: ${ARCH}, VERSION: ${VERSION}"

if [ "$OS" = "Linux" ]; then
    case "$ARCH" in
        x86_64)
            PKG_NAME="fzf-${VERSION}-linux_amd64"
            PKG_TARBALL="${PKG_NAME}.tar.gz"
            ;;
        aarch64)
            PKG_NAME="fzf-${VERSION}-linux_arm64"
            PKG_TARBALL="${PKG_NAME}.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
elif [ "$OS" = "Darwin" ]; then
    case "$ARCH" in
        x86_64)
            PKG_NAME="fzf-${VERSION}-darwin_amd64"
            PKG_TARBALL="${PKG_NAME}.tar.gz"
            ;;
        arm64)
            PKG_NAME="fzf-${VERSION}-darwin_arm64"
            PKG_TARBALL="${PKG_NAME}.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
else
    echo "Unsupported OS: $OS" >&2
    exit 1
fi

WORK_DIR="${SCRIPT_DIR}/.__TMP__"
if [ -d "${WORK_DIR}" ]; then
    rm -rf "${WORK_DIR}"
fi
mkdir -p "${WORK_DIR}"
cd "${WORK_DIR}"

INSTALL_PATH="${HOME}/LocalApps"
EXECUTIVE_PATH="${HOME}/bin"

DOWNLOAD_URL="https:/github.com/junegunn/fzf/releases/download/v${VERSION}/${PKG_TARBALL}"
curl -LO "${DOWNLOAD_URL}"
tar xvf "${PKG_TARBALL}"

mv ./fzf "${INSTALL_PATH}/fzf"
ln -sfv "${INSTALL_PATH}/fzf" "${EXECUTIVE_PATH}/fzf"

cd ..
rm -rf "${WORK_DIR}"

echo "complete install ${PKG_NAME}"
