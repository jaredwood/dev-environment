#!/bin/bash

VERSION=$(curl -sSL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | jq --raw-output .tag_name)
REPO="https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/"
FILENAME="ripgrep_${VERSION}_amd64.deb"

echo "Fetching ${FILENAME} from ${REPO}."

wget ${REPO}${FILENAME}
dpkg -i ${FILENAME}
rm ${FILENAME}
