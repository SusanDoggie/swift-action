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

SDK=${SDK:-macosx}
DESTINATION=${DESTINATION:-'platform=macOS'}
ENABLE_CODECOV=${DESTINATION:-false}

XCODEBUILD_CONFIG: "-configuration Release -sdk ${SDK}"
SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)

for SCHEME in ${SCHEMES}; do
  echo "Testing scheme ${SCHEME}"
  xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} build-for-testing -skipUnavailableActions | xcpretty -f `xcpretty-travis-formatter`
  xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} -destination "${DESTINATION}" test-without-building -skipUnavailableActions -enableCodeCoverage ${ENABLE_CODECOV} | xcpretty -f `xcpretty-travis-formatter`
done
