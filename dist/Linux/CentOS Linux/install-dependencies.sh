#!/bin/bash
set -e

yum update

function is_package {
  if yum list installed $1 >/dev/null 2>&1; then
    true
  else
    false
  fi
}

echo "Installing git"
if ! is_package git; then
  yum install -y git
fi

echo "Installing zlib"
if ! is_package zlib-devel; then
  yum install -y zlib-devel
fi
