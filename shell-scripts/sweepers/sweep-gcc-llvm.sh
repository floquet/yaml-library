#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export SECONDS=0
export counter=0
function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}
export arch=$(spack arch)

new_step "Specify gcc versions"
export tpl="gcc"
export versions="9.1.0 8.3.0 7.4.0 6.5.0 5.5.0 4.9.3"

for v in ${versions}; do
    export tail="% ${1} arch=${arch}"
    new_step "spack install ${tpl} @ ${v} ${tail}"
              spack install ${tpl} @ ${v} ${tail}

    new_step "spack compiler find $(spack location --install-dir ${tpl} @ ${v}) % ${1}"
              spack compiler find $(spack location --install-dir ${tpl} @ ${v}) % ${1}
done

new_step "Specify llvm versions"
export tpl="llvm"
export versions="8.0.0  7.0.1  7.0.0  6.0.1  6.0.0"

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
