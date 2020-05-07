#!/bin/bash
set -e

apt-get update

function is_package {
  if dpkg-query -W -f='${Status}\n' $1 | grep "install ok installed"; then
    true
  else
    false
  fi
}

echo "Installing git"
if ! is_package git; then
  apt-get install -y git
fi

echo "Installing zlib"
if ! is_package zlib1g-dev; then
  apt-get install -y zlib1g-dev
fi

echo "Installing libxml2"
if ! is_package libxml2; then
  apt-get install -y libxml2
fi
