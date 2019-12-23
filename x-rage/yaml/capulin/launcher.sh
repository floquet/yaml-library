#!/bin/bash -l

printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

echo "sbatch /lustre/cpscratch1/dantopa/repos/github/yaml-library/x-rage/capulin/sbatch-creator.sh"
      sbatch /lustre/cpscratch1/dantopa/repos/github/yaml-library/x-rage/capulin/sbatch-creator.sh
