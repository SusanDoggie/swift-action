#!/bin/bash
set -e

SCRIPT_DIR="$( dirname "${BASH_SOURCE[0]}" )"

echo ">> uname: $(uname)"
if [ "$(uname)" == "Darwin" ]; then
  SYSTEM="macos"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  SYSTEM="linux"
else
  echo ">> Unsupported platform!"
  exit 1
fi

bash ${SCRIPT_DIR}/${SYSTEM}/test.sh
