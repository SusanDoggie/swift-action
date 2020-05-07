#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. /etc/os-release
echo ">> NAME: ${NAME}"

bash '${SCRIPT_DIR}/${NAME}/install-dependencies.sh'
