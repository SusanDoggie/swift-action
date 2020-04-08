#!/bin/bash
set -e

if [ "${USE_XCOEBUILD}" = true ] ; then

  SDK=${SDK:-macosx}
  DESTINATION=${DESTINATION:-'platform=macOS'}
  ENABLE_CODECOV=${DESTINATION:-false}

  XCODEBUILD_CONFIG="-configuration Release -sdk ${SDK}"
  SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)

  for SCHEME in ${SCHEMES}; do
    echo "Testing scheme ${SCHEME}"
    xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} build-for-testing -skipUnavailableActions
    xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} -destination "${DESTINATION}" test-without-building -skipUnavailableActions -enableCodeCoverage ${ENABLE_CODECOV}
  done

else
  swift test -c release --enable-test-discovery
fi
