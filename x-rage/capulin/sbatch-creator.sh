#!/bin/bash -l

# # capulin arm login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --output=spack-setup.out
#SBATCH --job-name=spack-setup

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

SECONDS=0
export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results

export dir_spack="capulin-arm-xrage.spack"

function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

new_step "Jump to spack directory"
echo "cd /lustre/cpscratch1/dantopa/repos/spack/xrage"
      cd /lustre/cpscratch1/dantopa/repos/spack/xrage

new_step "Clone spack"
echo "rm -rf ${dir_spack}"
      rm -rf ${dir_spack}

echo "git clone https://github.com/spack/spack ${dir_spack}"
      git clone https://github.com/spack/spack ${dir_spack}

new_step "Initialize spack"
echo "cd ${dir_spack}"
      cd ${dir_spack}

echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

echo "cd /lustre/cpscratch1/dantopa/repos/github/yaml-library/yaml-library/x-rage/capulin/arm"
      cd /lustre/cpscratch1/dantopa/repos/github/yaml-library/yaml-library/x-rage/capulin/arm

# tailored yaml files
echo "cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/"
      cp *.yaml ${SPACK_ROOT}/etc/spack/defaults/

# chose tcl over lmod
echo "cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml"
      cp ${SPACK_ROOT}/etc/spack/defaults/tcl-modules.yaml ${SPACK_ROOT}/etc/spack/defaults/modules.yaml

new_step "Base installs"
echo "cd ${SPACK_ROOT}"
      cd ${SPACK_ROOT}

echo "source /lustre/cpscratch1/dantopa/repos/github/yaml-library/x-rage/bash-scripts/install-xrage-dependents.sh ${gcc_system_compiler}"
      source /lustre/cpscratch1/dantopa/repos/github/yaml-library/x-rage/bash-scripts/install-xrage-dependents.sh ${gcc_system_compiler}

new_step "Secondary installs"
echo  "No secondary installs"

new_step "Verify module creation"
echo "spack module tcl  refresh --delete-tree"
      spack module tcl  refresh --delete-tree

echo "mkdir -p topa"
      mkdir -p topa

echo "module avail > topa/modules-after.txt"
      module avail > topa/modules-after.txt

export configs="compilers mirrors modules packages"
for c in ${configs}; do
    echo "spack config blame ${c} > topa/config-${c}.txt"
          spack config blame ${c} > topa/config-${c}.txt
done

new_step "Conclude"
echo "time used = ${SECONDS} s"
      time used = ${SECONDS} s

echo ""
echo "mv spack-setup.out topa/spack-setup-${ymd}.out"
      mv spack-setup.out topa/spack-setup-${ymd}.out
