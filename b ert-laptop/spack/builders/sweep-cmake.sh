#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export SECONDS=0
export counter=0
function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

export arch="$(spack arch)"

export tpl="cmake"
new_step "Specify ${tpl} versions"
export versions="3.16.1 3.15.5 3.14.5 3.13.4"

for v in ${versions}; do
    export tail="% gcc @ 4.8.5 arch=${arch}"
    new_step "spack install ${tpl} @ ${v} ${tail}"
              spack install ${tpl} @ ${v} ${tail}
done

new_step "Execution complete"
echo ""; echo "time used = ${SECONDS} s"
date
