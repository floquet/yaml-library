#!/bin/bash -l

# # darwin arm login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --partition=arm
#SBATCH --output=darwin-arm-batch.out
#SBATCH --job-name=arm-builds

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results

function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

new_step "Jump to spack directory"
echo "cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-arm"
      cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-arm
echo "\${pwd} = ${pwd}"

new_step "Initialize spack"
echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

new_step "List modules"
echo "module list"
      module list

new_step "List compilers recognized by spack"
echo "spack compilers"
      spack compilers

new_step "List blas providers recognized by spack"
echo "spack providers blas"
      spack providers blas

new_step "List mpi providers recognized by spack"
echo "spack providers mpi"
      spack providers mpi

new_step "List requested compilers"
export compilers=""
export compilers="${compilers} arm@19.1  arm@18.4.2  arm@18.4.1 clang@8.0.0  clang@7.0.0"

census=( ${compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${compilers}"

for c in ${compilers}; do
    new_step "Run installs with compiler ${c}"
    echo ". topa/install-xrage-dependents.sh ${c}"
          . topa/install-xrage-dependents.sh ${c}
    spack clean -a
done

new_step "List all spack builds"
echo "spack find"
      spack find

new_step "Archive batch output"
mv darwin-arm-batch.out darwin-arm-batch-${ymd}.out
