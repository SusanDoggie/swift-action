#!/bin/bash
set -e

WORKING_DIR=$PWD

if [ ! -e "${WORKING_DIR}/Tests" ]; then
  echo ">> No test cases found."
  exit 0
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ">> uname: $(uname)"
SYSTEM="$(uname)"

bash "${SCRIPT_DIR}/${SYSTEM}/test.sh"
