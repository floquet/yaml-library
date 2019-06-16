#!/bin/bash -l

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"
# launch point: ${dir_xrage}/${host_name}/${partition}

export dir_xrage="/scratch/users/dantopa/repos/github/yaml-library/x-rage/bash-scripts"

export host_name="darwin"
export partition="arm"
export dir_build="/scratch/users/dantopa/repos/spack/xrage/${host_name}/${partition}/"
export dir_spack="${dir_build}/${host_name}-${partition}-super.spack"

if [[ ! -d "${dir_xrage}" ]]; then
    echo "directory not found: \${dir_xrage} = ${dir_xrage}"
    echo "looking for yaml library and bash scripts"
    exit -1
fi
if [[ ! -d "${dir_build}" ]]; then
    echo "directory not found: \${dir_build} = ${dir_build}"
    echo "target directory to build spack"
    exit -1
fi

echo "cd ${dir_arm}"
      cd ${dir_arm}

echo "rm -rf ${dir_spack}"
      rm -rf ${dir_spack}

echo "git clone https://github.com/spack/spack ${dir_spack}"
      git clone https://github.com/spack/spack ${dir_spack}

echo "cd ${dir_spack}"
      cd ${dir_spack}

echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

echo "cd ${dir_xrage}/${host_name}/${partition}"
      cd ${dir_xrage}/${host_name}/${partition}

# tailored yaml files
echo "cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/"
      cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/

# chose tcl over lmod
echo "cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml"
      cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml

export thisArch=$(spack arch);
echo "\${thisArch} = ${thisArch}"

sbatch ${dir_scripts}/bash-scripts/sbatch-sweeper.sh gcc@4.8.5
sbatch ${dir_scripts}/bash-scripts/sbatch-sweeper.sh gcc@7.1.0
sbatch ${dir_scripts}/bash-scripts/sbatch-sweeper.sh gcc@8.2.0
sbatch ${dir_scripts}/bash-scripts/sbatch-sweeper.sh gcc@9.1.0
