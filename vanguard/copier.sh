#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

cp ${host_name}/*.yaml ${SPACK_ROOT}/etc/spack/defaults
