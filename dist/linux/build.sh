#!/bin/bash
set -e

WORKING_DIR=$PWD

if [ -e "${WORKING_DIR}/.github/workflows/before_build.sh" ]; then
  bash ${WORKING_DIR}/.github/workflows/before_tests.sh
fi

swift build -c release --enable-test-discovery
