#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
 httpd
 postgresql
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi
