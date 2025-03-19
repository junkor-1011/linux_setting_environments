#!/usr/bin/env bash
set -euxo pipefail

# get script path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR"

OS="$(uname -s)"
ARCH="$(uname -m)"

VERSION="$(curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')"

INSTALL_PATH="${HOME}/LocalApps"
EXECTIVE_PATH="${HOME}/bin"

# TGZ_FILENAME="trivy_${VERSION}_${OS}-${CPU_ARCH}.tar.gz"
if [ "$OS" = "Linux" ]; then
    case "$ARCH" in
        x86_64)
            TGZ_FILENAME="trivy_${VERSION}_${OS}-64bit.tar.gz"
            ;;
        aarch64)
            TGZ_FILENAME="trivy_${VERSION}_${OS}-ARM64.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
elif [ "$OS" = "Darwin" ]; then
    case "$ARCH" in
        arm64)
            TGZ_FILENAME="trivy_${VERSION}_macOS-ARM64.tar.gz"
            ;;
        x86_64)
            TGZ_FILENAME="trivy_${VERSION}_macOS-64bit.tar.gz"
            ;;
        *)
            echo "Unsupported architecture: $ARCH" >&2
            exit 1
    esac
else
    echo "Unsupported OS: $OS" >&2
    exit 1
fi

DOWNLOAD_URL="https://github.com/aquasecurity/trivy/releases/download/v${VERSION}/${TGZ_FILENAME}"

WORK_DIR="__TMP__"
mkdir "${WORK_DIR}"
cd "${WORK_DIR}"
curl -LO "${DOWNLOAD_URL}"
tar xzvf ${TGZ_FILENAME}
mv trivy "${INSTALL_PATH}/trivy"
ln -sfv "${INSTALL_PATH}/trivy" "${EXECTIVE_PATH}/trivy"

# cleanup
cd ..
rm -rf "${WORK_DIR}"

echo "trivy v${VERSION} has been installed."
