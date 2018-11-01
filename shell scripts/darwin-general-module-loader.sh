#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

function compiler_finder () {
    for m in ${modules}; do
        module purge
        module load ${m}
        spack compiler find
    done
}

echo ""; echo "gcc compilers"
export modules="gcc/4.6.4 gcc/4.9.2 gcc/4.9.3 gcc/5.4.0 gcc/5.5.0 gcc/6.3.0 gcc/6.4.0 gcc/7.2.0 gcc/7.3.0 gcc/8.1.0 gcc/8.2.0"
compiler_finder ${modules}

echo ""; echo "intel compilers"
export modules="intel/16.0.3 intel/16.0.4 intel/17.0.1 intel/17.0.6 intel/18.0.2 intel/18.0.3 intel/19.0.0"
compiler_finder ${modules}

echo ""; echo "pgi compilers"
export modules="pgi/16.10 pgi/17.10 pgi/17.4 pgi/18.3 pgi/18.4 pgi/18.7"
compiler_finder ${modules}

date
