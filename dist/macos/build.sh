#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

if [ "${USE_XCODEBUILD}" = true ] ; then

  SDK=${SDK:-macosx}
  XCODEBUILD_CONFIG="-configuration ${CONFIGURATION} -sdk ${SDK}"
  
  echo "CONFIGURATION: ${CONFIGURATION}"
  echo "SDK: ${SDK}"
  
  SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)
  
  for SCHEME in ${SCHEMES}; do
    echo "Building scheme ${SCHEME}"
    xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME}
  done

else
  swift build -c ${CONFIGURATION} --enable-test-discovery
fi
