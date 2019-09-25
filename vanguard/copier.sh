#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

set -x -v

cp ${host_name}/*.yaml ${SPACK_ROOT}/etc/spack/defaults
cp ${SPACK_ROOT}/etc/spack/defaults/${host_name}-${partition}-compilers.yaml compilers.yaml
rm ${SPACK_ROOT}/etc/spack/defaults/${host_name}-*-compilers.yaml

set +x +v
