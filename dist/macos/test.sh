#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

if [ "${USE_XCODEBUILD}" = true ] ; then

  SDK=${SDK:-macosx}
  DESTINATION=${DESTINATION:-'platform=macOS'}
  XCODEBUILD_CONFIG="-configuration ${CONFIGURATION} -sdk ${SDK}"
  
  if [ "${ENABLE_CODECOV}" = true ] ; then
    ENABLE_CODECOV=YES
  else
    ENABLE_CODECOV=NO
  fi
  
  echo "SDK: ${SDK}"
  echo "DESTINATION: ${DESTINATION}"
  echo "ENABLE_CODECOV: ${ENABLE_CODECOV}"
  
  SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)

  for SCHEME in ${SCHEMES}; do
    echo "Testing scheme ${SCHEME}"
    xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} build-for-testing -skipUnavailableActions
    xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} -destination "${DESTINATION}" test-without-building -skipUnavailableActions -enableCodeCoverage ${ENABLE_CODECOV}
  done

else
  swift test -c ${CONFIGURATION} --enable-test-discovery
fi
