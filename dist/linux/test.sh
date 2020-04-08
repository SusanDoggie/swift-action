#!/bin/bash
set -e

CONFIGURATION=${CONFIGURATION:-release}

swift test -c ${CONFIGURATION} --enable-test-discovery
