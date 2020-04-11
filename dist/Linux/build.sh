#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

echo "CONFIGURATION: ${CONFIGURATION}"

swift build -c ${CONFIGURATION} --enable-test-discovery
