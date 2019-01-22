#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

source "myCompilers.sh"
tpl="cmake libpciaccess"

for c in ${l_compilers}; do
    echo ""
    echo "compiler = ${c}"
    for t in ${tpl}; do
    echo "spack install ${t} % ${c}"
          spack install ${t} % ${c}
          spack clean -a
    done
done
