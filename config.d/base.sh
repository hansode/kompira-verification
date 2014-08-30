#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...

name=kompira
version=1.4.0

basename=${name}-${version}-bin
filename=${basename}.tar.gz

cd /tmp

if ! [[ -f /tmp/${filename} ]]; then
  curl -fSkL https://bitbucket.org/kompira/package/downloads/${filename} -o ${filename}
fi

if ! [[ -d ${basename} ]]; then
  tar zxvf ${filename}
fi

cd ${basename}
time sudo ./install.sh
