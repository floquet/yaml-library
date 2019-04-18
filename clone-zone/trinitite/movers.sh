#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export path="${scratch}/spack/libraries"
export tpls="libhio openmpi pmix ucx"

for t in ${tpl}; do
    echo 'cp *.yaml "${path}/${hpc}-standard.${t}/etc/spack/defaults/."'
          cp *.yaml "${path}/${hpc}-standard.${t}/etc/spack/defaults/."
done
