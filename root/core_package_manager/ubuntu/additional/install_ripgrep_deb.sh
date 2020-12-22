#!/usr/bin/env bash
# executer: root

# ripgrep version
VERSION=12.1.1
FILENAME_DEB=ripgrep_${VERSION}_amd64.deb
DOWNLOAD_URL=https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/${FILENAME_DEB}

# download
curl -LO ${DOWNLOAD_URL}

# install
dpkg -i ${FILENAME_DEB}

# remove deb
rm ${FILENAME_DEB}
