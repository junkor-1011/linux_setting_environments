#!/usr/bin/env bash
set -euxo pipefail

# get script path
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

OS="$(uname -s)"
ARCH="$(uname -m)"

#VERSION="$(curl --silent "https://api.github.com/repos/ziglang/zig/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')"
VERSION="$(curl -s https://api.github.com/repos/ziglang/zig/releases/latest | sed -n 's/.*"tag_name": "\(.*\)",/\1/p')"

if [ "${OS}" = "Linux" ]; then
    PKG_NAME="zig-linux-${ARCH}-${VERSION}"
elif [ "${OS}" = "Darwin" ]; then
    case "$ARCH" in
        arm64)
            PKG_NAME="zig-macos-aarch64-${VERSION}"
            ;;
        x86_64)
            PKG_NAME="zig-macos-x86_64-${VERSION}"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
else
    echo "Unsupported OS: $OS" >&2
    exit 1
fi

PKG_TARBALL="${PKG_NAME}.tar.xz"

INSTALL_BASE="${HOME}/LocalApps"
# INSTALL_PATH="${INSTALL_BASE}/${PKG_NAME}"
EXECUTIVE_PATH="${HOME}/bin"

DOWNLOAD_URL="https://ziglang.org/download/${VERSION}/${PKG_TARBALL}"

WORK_DIR="${SCRIPT_DIR}/__TMP__"
if [ -d "${WORK_DIR}" ]; then
    rm -rf "${WORK_DIR}"
fi
mkdir -p "${WORK_DIR}"
cd "${WORK_DIR}"

echo "DEBUG, DOWNLOAD_URL: ${DOWNLOAD_URL}"

curl -LO "${DOWNLOAD_URL}"
tar xvf "${PKG_TARBALL}"

if [ ! -d "${INSTALL_BASE}" ]; then
    mkdir -p "${INSTALL_BASE}"
fi

if [ -d "${INSTALL_BASE}/${PKG_NAME}" ]; then
    rm -rf "${INSTALL_BASE}/${PKG_NAME}" 
fi

if [ "$OS" = "Darwin" ]; then
    mv "${PKG_NAME}" "${INSTALL_BASE}"
else
    mv "${PKG_NAME}" -t "${INSTALL_BASE}"
fi

ln -snfv "${INSTALL_BASE}/${PKG_NAME}/zig" "${EXECUTIVE_PATH}/zig"

cd ..
rm -rf "${WORK_DIR}"

echo "zig-${VERSION} has been installed."
