#!/bin/bash -l

# # darwin general login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --partition=general
#SBATCH --output=darwin-general-batch.out
#SBATCH --job-name=general-builds

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export partition="general"
export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results
export dir_recipe="/scratch/users/dantopa/repos/github/yaml-library/x-rage/bash-scripts"

function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

new_step "Jump to spack directory"
echo "cd /scratch/users/dantopa/repos/spack/xrage/${partition}/xrage-darwin-${partition}"
      cd /scratch/users/dantopa/repos/spack/xrage/${partition}/xrage-darwin-${partition}
echo "\${pwd}        = ${pwd}"
echo "\${dir_recipe} = ${dir_recipe}"

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
export compilers="${compilers} gcc@9.1.0  gcc@8.2.0  gcc@7.3.0  gcc@6.4.0"
export compilers="${compilers} intel@18.0.3  intel@17.0.6  intel@16.0.4"
export compilers="${compilers} pgi@18.10  pgi@17.10  pgi@16.10"

census=( ${compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${compilers}"

for c in ${compilers}; do
    new_step "Run installs with compiler ${c}"
    echo ". ${dir_recipe}/install-xrage-dependents.sh ${c}"
          . ${dir_recipe}/install-xrage-dependents.sh ${c}
    spack clean -a
done

new_step "List all spack builds"
echo "spack find"
      spack find

new_step "Archive batch output"
mv darwin-${partition}-batch.out darwin-${partition}-batch-${ymd}.out
