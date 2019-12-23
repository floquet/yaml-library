#!/bin/bash -l

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

echo "cp config.guess  ${1}"
      cp config.guess  ${1}
echo "cp config.sub    ${1}"
      cp config.sub    ${1}

echo "ls -alh config.* ${1}"
      ls -alh config.* ${1}


