#!/bin/bash -l

# # darwin ARM login
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH --time=10:00:00
#SBATCH --partition=power9
#SBATCH --output=darwin-power9-batch.out
#SBATCH --job-name=power9-builds

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

echo "cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-power9"
      cd /scratch/users/dantopa/repos/spack/xrage/arm/xrage-darwin-power9

echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

echo ""
echo "module list"
      module list

echo ""
echo "spack compilers"
      spack compilers

export compilers="arm@19.1 arm@19.0 clang@8.0.0 clang@7.0.0 pgi@18.10 pgi@17.10 pgi@16.10 xl@16.1.1.3  xl@16.1.1.2  xl@16.1.1.0  xl@16.1.1"

for c in ${compilers}; do
    echo ". topa/install-xrage-dependents.sh ${c}"
          . topa/install-xrage-dependents.sh ${c}
    spack clean -a
done

echo "spack find"
      spack find
