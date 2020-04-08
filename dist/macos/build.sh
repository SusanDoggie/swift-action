#!/bin/bash
set -e

WORKING_DIR=$PWD

if [ -e "${WORKING_DIR}/.github/workflows/before_build.sh" ]; then
  bash ${WORKING_DIR}/.github/workflows/before_tests.sh
fi

SDK=${SDK:-macosx}

XCODEBUILD_CONFIG: "-configuration Release -sdk ${SDK}"
SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)

for SCHEME in ${SCHEMES}; do
  echo "Building scheme ${SCHEME}"
  xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} | xcpretty -f `xcpretty-travis-formatter`
done
