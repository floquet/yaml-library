#!/bin/bash -l

# # darwin power9 login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --partition=power9
#SBATCH --output=darwin-power9-batch.out
#SBATCH --job-name=power9-builds

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

new_step "Jump to spack directory"
echo "cd /scratch/users/dantopa/repos/spack/xrage/power9/xrage-darwin-power9"
      cd /scratch/users/dantopa/repos/spack/xrage/power9/xrage-darwin-power9
echo "\${pwd} = ${pwd}"

new_step "Initialize spack"
echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

new_step "List modules"
echo "module list"
      module list

new_step "List blas providers recognized by spack"
echo "spack providers blas"
      spack providers blas

new_step "List mpi providers recognized by spack"
echo "spack providers mpi"
      spack providers mpi

new_step "List compilers recognized by spack"
echo "spack compilers"
      spack compilers

new_step "List requested compilers"
export compilers="clang@8.0.0 clang@7.0.0 pgi@18.10 pgi@17.10 pgi@16.10 xl@16.1.1.3  xl@16.1.1.2  xl@16.1.1.0  xl@16.1.1"

for c in ${compilers}; do
    new_step "Run installs with compiler ${c}"
    echo ". topa/install-xrage-dependents.sh ${c}"
          . topa/install-xrage-dependents.sh ${c}
    spack clean -a
done

new_step "List all spack builds"
echo "spack find"
      spack find
