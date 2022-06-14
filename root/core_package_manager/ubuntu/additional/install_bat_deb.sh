#!/usr/bin/env bash

VERSION=0.21.0
FILENAME_DEB=bat-musl_${VERSION}_amd64.deb
DOWNLOAD_URL=https://github.com/sharkdp/bat/releases/download/v${VERSION}/${FILENAME_DEB}

# download deb
curl -LO ${DOWNLOAD_URL}

# install
dpkg -i ${FILENAME_DEB}

# cleanup
rm ${FILENAME_DEB}
