#!/bin/bash
set -e

swift test -c release --enable-test-discovery
