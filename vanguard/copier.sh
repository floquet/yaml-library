#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

dir_from="${yaml_library}/vanguard"
  dir_to="${SPACK_ROOT}/etc/spack/defaults"

set -x

# modules, packages
cp ${dir_from}/*.yaml                      ${dir_to}
cp ${dir_from}/${host_name}/compilers.yaml ${dir_to}
cp ${dir_from}/${host_name}/mirrors.yaml   ${dir_to}

set +x +v
