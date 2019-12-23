#! /bin/bash

# . topa/sweep-ucx.sh gcc@4.9.3
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export SECONDS=0
export counter=0
function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}
export arch=$(spack arch)

new_step "Specify ucx versions"
export tpl="ucx"
export versions="1.6.0  1.5.2  1.5.1  1.5.0  1.4.0  1.3.1  1.3.0  1.2.2  1.2.1"

for v in ${versions}; do
    export tail="% ${1} arch=${arch}"
    new_step "spack install ${tpl} @ ${v} ${tail}"
              spack install ${tpl} @ ${v} ${tail}

    new_step "spack compiler find $(spack location --install-dir ${tpl} @ ${v}) % ${1}"
              spack compiler find $(spack location --install-dir ${tpl} @ ${v}) % ${1}
done

new_step "Execution complete"
echo ""; echo "time used = ${SECONDS} s"
date
