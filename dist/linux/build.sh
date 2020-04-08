#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

swift build -c ${CONFIGURATION} --enable-test-discovery
