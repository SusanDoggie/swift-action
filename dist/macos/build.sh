#!/bin/bash
set -e

SDK=${SDK:-macosx}

XCODEBUILD_CONFIG: "-configuration Release -sdk ${SDK}"
SCHEMES=$(xcodebuild -list | grep --after-context=-1 '^\s*Schemes:' | tail -n +2 | xargs)

for SCHEME in ${SCHEMES}; do
  echo "Building scheme ${SCHEME}"
  xcodebuild ${XCODEBUILD_CONFIG} -scheme ${SCHEME} | xcpretty -f `xcpretty-travis-formatter`
done
