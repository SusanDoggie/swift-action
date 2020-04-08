#!/bin/bash
set -e

WORKING_DIR=$PWD

if [ ! -e "${WORKING_DIR}/Tests" ]; then
  echo ">> No test cases found."
  exit 0
fi

if [ -e "${WORKING_DIR}/.github/workflows/before_tests.sh" ]; then
  bash ${WORKING_DIR}/.github/workflows/before_tests.sh
fi

swift test -c release --enable-test-discovery
