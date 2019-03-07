#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export dir_target="${SPACK_ROOT}/etc/spack/defaults"

export yaml="compilers"
echo "${yaml}"
echo "cp  ${yaml_library}/${yaml}.yaml/${host_name}-${partition}-system-${yaml}.yaml   ${dir_target}/${yaml}.yaml"
      cp "${yaml_library}/${yaml}.yaml/${host_name}-${partition}-system-${yaml}.yaml" "${dir_target}/${yaml}.yaml"

export yaml="mirrors"
echo "${yaml}"
echo "cp ${yaml_library}/${yaml}.yaml/${yaml}.yaml ${dir_target}/${yaml}.yaml"
      cp ${yaml_library}/${yaml}.yaml/${yaml}.yaml ${dir_target}/${yaml}.yaml

export yaml="modules"
echo "${yaml}"
echo "cp ${yaml_library}/${yaml}.yaml/tcl-${yaml}.yaml ${dir_target}/${yaml}.yaml"
      cp ${yaml_library}/${yaml}.yaml/tcl-${yaml}.yaml ${dir_target}/${yaml}.yaml

export yaml="packages"
echo "${yaml}"
echo "cp ${yaml_library}/${yaml}.yaml/flag-${yaml}.yaml ${dir_target}/${yaml}.yaml"
      cp ${yaml_library}/${yaml}.yaml/flag-${yaml}.yaml ${dir_target}/${yaml}.yaml

lss ${dir_target}

date
