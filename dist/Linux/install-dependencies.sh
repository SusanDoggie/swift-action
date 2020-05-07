#!/bin/bash
set -e

if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
fi

if [ "${OS}" = "Ubuntu" ] ; then

apt-get update

function is_package {
  if dpkg-query -W -f='${Status}\n' $1 | grep "install ok installed"; then
    true
  else
    false
  fi
}

function install {
  apt-get install -y $1
}

elif [ "${OS}" = "CentOS Linux" || "${OS}" = "Amazon Linux" ] ; then

yum update

function is_package {
  if yum list installed $1 >/dev/null 2>&1; then
    true
  else
    false
  fi
}

function install {
  yum install -y $1
}

fi

echo "Installing git\n"
if ! is_package git; then
  install git
fi

echo "Installing zlib\n"
if [ "${OS}" = "Ubuntu" ] ; then

if ! is_package zlib1g-dev; then
  install zlib1g-dev
fi

elif [ "${OS}" = "CentOS Linux" || "${OS}" = "Amazon Linux" ] ; then

if ! is_package zlib-devel; then
  install zlib-devel
fi

fi

echo "Installing libxml2\n"
if ! is_package libxml2; then
  install libxml2
fi
