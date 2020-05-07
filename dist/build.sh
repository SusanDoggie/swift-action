#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ">> uname: $(uname)"
SYSTEM="$(uname)"

bash ${SCRIPT_DIR}/${SYSTEM}/install-dependencies.sh

bash ${SCRIPT_DIR}/${SYSTEM}/build.sh
