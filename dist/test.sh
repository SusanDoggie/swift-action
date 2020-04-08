#!/bin/bash
set -e

WORKING_DIR=$PWD
SCRIPT_DIR="$( dirname "${BASH_SOURCE[0]}" )"

if [ ! -e "${WORKING_DIR}/Tests" ]; then
  echo ">> No test cases found."
  exit 0
fi

if [ -e "${WORKING_DIR}/.github/workflows/before_tests.sh" ]; then
  bash ${WORKING_DIR}/.github/workflows/before_tests.sh
fi

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
