#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

echo "CONFIGURATION: ${CONFIGURATION}"

swift test -c ${CONFIGURATION} --enable-test-discovery
