#!/bin/bash -l

# # ${host_name} arm login
#SBATCH --nodes=1
#SBATCH --qos=standard
#SBATCH --time=10:00:00
#SBATCH --output=spack-setup.out
#SBATCH --job-name=spack-setup

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

SECONDS=0
export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results
export faust="--disable-locks" # faustian bargain to run fs without flock

export host_name="capulin"
export partition="arm"
# export spack_compiler="gcc@7.3.0"
export spack_compiler="cce@8.7.10"
export dir_here=$(pwd)

export dir_xrage="/lustre/cpscratch1/dantopa/repos/github/yaml-library/x-rage" # source for yamls and scripts
export dir_build="/lustre/cpscratch1/dantopa/repos/spack/xrage" # where to build
export dir_spack="${dir_build}/${host_name}-${partition}-super.spack" # what to build

export counter=0
function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

new_step "Validate directories"

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
echo "Validated directories:"
echo "\${dir_xrage} = ${dir_xrage}"
echo "\${dir_build} = ${dir_build}"

new_step "Cray module swaps"
echo "spack compiler: \${spack_compiler} =  ${spack_compiler}"
# echo "module switch PrgEnv-cray PrgEnv-gnu"
#       module switch PrgEnv-cray PrgEnv-gnu
# echo "module switch cce gcc/7.3.0"
#       module switch cce gcc/7.3.0
echo "module list"
      module list

new_step "Initialize spack"
echo "cd ${dir_spack}"
      cd ${dir_spack}

echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

echo "cd ${dir_xrage}/${host_name}"
      cd ${dir_xrage}/${host_name}

# tailored yaml files
echo "cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/"
      cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/

# chose tcl over lmod
echo "cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml"
      cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml

export thisArch=$(spack arch);
echo "\${thisArch} = ${thisArch}"

new_step "Load list of applications"
list_tpl=""
list_tpl="${list_tpl} calico@2"
list_tpl="${list_tpl} eospac@6.4.0 eospac@6.3.1"
list_tpl="${list_tpl} fftw@3.3.8 fftw@3.3.6-pl2"
list_tpl="${list_tpl} googletest@1.8.1 googletest@1.7.0"
list_tpl="${list_tpl} hdf5@1.10.5 hdf5@1.10.2"
list_tpl="${list_tpl} hypre@2.15.1 hypre@2.11.2 hypre@2.11.1 hypre@2.10.0b"
list_tpl="${list_tpl} kokkos@2.8.00 kokkos@2.7.24 kokkos@2.7.00"
list_tpl="${list_tpl} libhio@1.4.1.2 libhio@1.4.1.3"
list_tpl="${list_tpl} netlib-lapack@3.8.0 netlib-lapack@3.7.1"
list_tpl="${list_tpl} openblas@0.3.6 openblas@0.2.20"
list_tpl="${list_tpl} openmpi@3.0.4 openmpi@3.1.4 openmpi@4.0.1"
list_tpl="${list_tpl} pfunit@3.3.3 pfunit@3.2.10 pfunit@3.2.9"
list_tpl="${list_tpl} silo@4.10.2-bsd silo@4.9"
list_tpl="${list_tpl} sundials@4.1.0 sundials@3.1.2"

census=( ${list_tpl} )
echo "${#census[@]} Spack-recognized applications to be built:"
echo "${list_tpl}"

new_step "Base installs"
echo "cd ${SPACK_ROOT}"
      cd ${SPACK_ROOT}

echo "mkdir -p topa"
      mkdir -p topa

echo "spack clean --all"
      spack clean --all

for t in ${list_tpl}; do
    echo ""; echo "*  *  *"
    echo "spack ${faust} install ${t} % ${spack_compiler} arch=${thisArch}"
          spack ${faust} install ${t} % ${spack_compiler} arch=${thisArch}
done
echo "source ${dir_yaml}/bash-scripts/install-xrage-dependents.sh ${spack_compiler}"
      source ${dir_yaml}/bash-scripts/install-xrage-dependents.sh ${spack_compiler}

new_step "Secondary installs"
echo  "No secondary installs"

new_step "Verify module creation"
echo "module list > topa/modules-before.txt"
      module list > topa/modules-before.txt

echo "spack ${faust} module tcl  refresh --delete-tree"
      spack ${faust} module tcl  refresh --delete-tree

echo "mkdir -p topa"
      mkdir -p topa

echo "module avail > topa/modules-after.txt"
      module avail > topa/modules-after.txt

export configs="compilers mirrors modules packages"
for c in ${configs}; do
    echo "spack ${faust} config blame ${c} > topa/config-${c}.txt"
          spack ${faust} config blame ${c} > topa/config-${c}.txt
done

new_step "Conclude"
echo "time used = ${SECONDS} s"

echo ""
echo "mv ${dir_here}/spack-setup.out ${SPACK_ROOT}/topa/spack-setup-${ymd}.out"
      mv ${dir_here}/spack-setup.out ${SPACK_ROOT}/topa/spack-setup-${ymd}.out
