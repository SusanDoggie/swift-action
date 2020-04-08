#!/bin/bash
set -e

swift build -c release --enable-test-discovery
