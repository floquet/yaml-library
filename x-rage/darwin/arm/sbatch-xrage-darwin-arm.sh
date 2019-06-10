#!/bin/bash -l

# # darwin ARM login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --partition=arm
#SBATCH --output=darwin-arm-batch.out
#SBATCH --job-name=arm-builds

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

echo "cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-arm"
      cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-arm

echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

echo ""
echo "module list"
      module list

echo ""
echo "spack compilers"
      spack compilers

export spack_compiler="arm@19.1"
echo ". topa/install-xrage-dependents.sh ${spack_compiler}"
      . topa/install-xrage-dependents.sh ${spack_compiler}

export spack_compiler="arm@19.0"
echo ". topa/install-xrage-dependents.sh ${spack_compiler}"
      . topa/install-xrage-dependents.sh ${spack_compiler}

export spack_compiler="clang@8.0.0"
echo ". topa/install-xrage-dependents.sh ${spack_compiler}"
      . topa/install-xrage-dependents.sh ${spack_compiler}

export spack_compiler="clang@7.0.0"
echo ". topa/install-xrage-dependents.sh ${spack_compiler}"
      . topa/install-xrage-dependents.sh ${spack_compiler}

echo "spack find"
      spack find
