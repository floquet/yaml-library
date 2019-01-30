#!/bin/bash -l
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

module load PrgEnv-cray
export cray_modules="cce/8.4.6 cce/8.5.0 cce/8.5.2 cce/8.5.3 cce/8.5.5 cce/8.5.6 cce/8.5.7 cce/8.5.8 cce/8.6.0 cce/8.6.1 cce/8.6.2 cce/8.6.5 cce/8.7.0 cce/8.7.1 cce/8.7.2 cce/8.7.4 cce/8.7.5 cce/8.7.6 cce/8.7.7 cce/9.0.0.21672 cce/9.0.0.21672-classic"

for c in ${cray_modules}; do
    module load ${c}
    spack compiler add
    module unload ${c}
done
