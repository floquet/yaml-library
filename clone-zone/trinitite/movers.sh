#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export path="${scratch}/spack/libraries"
export tpls="libhio openmpi pmix ucx"

for t in ${tpls}; do
    echo 'cp *.yaml "${path}/${host_name}-standard.${t}/etc/spack/defaults/."'
          cp *.yaml "${path}/${host_name}-standard.${t}/etc/spack/defaults/."
done
