#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit
fi

VERSION=$(curl -sSL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | jq --raw-output .tag_name)
REPO="https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/"
FILENAME="ripgrep_${VERSION}_amd64.deb"

echo "Fetching ${FILENAME} from ${REPO}."

INITDIR=$PWD
TMPDIR=`mktemp -d`
cd $TMPDIR
echo $TMPDIR
wget ${REPO}${FILENAME} && dpkg -i ${FILENAME} && rm ${FILENAME}
cd $INITDIR
