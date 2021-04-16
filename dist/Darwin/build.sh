#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

if [ "${USE_XCODEBUILD}" = true ] ; then

  SDK=${SDK:-macosx}
  DESTINATION=${DESTINATION:-'platform=macOS'}
  
  echo "CONFIGURATION: ${CONFIGURATION}"
  echo "SDK: ${SDK}"
  echo "DESTINATION: ${DESTINATION}"

  if [ -z "{$SCHEMES}" ] ; then
    SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)
  fi
  
  for SCHEME in ${SCHEMES}; do
    echo "Building scheme ${SCHEME}"
    xcodebuild -scheme ${SCHEME} -configuration ${CONFIGURATION} -sdk ${SDK} -destination "${DESTINATION}"
  done

else
  swift build -c ${CONFIGURATION} --enable-test-discovery
fi
