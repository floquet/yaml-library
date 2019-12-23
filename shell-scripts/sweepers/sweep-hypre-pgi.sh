#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="hypre"
export versions="2.15.1  2.15.0  2.14.0"
export compilers="pgi@18.10  pgi@18.7  pgi@18.4  pgi@18.3"

cd /scratch/users/dantopa/new-spack/flag.power9.spack
. share/spack/setup-env.sh

export arch=$(spack arch)

spack clean --all

for c in ${compilers}; do
    for v in ${versions}; do
        echo ""
        echo "spack install ${tpl} @ ${v} % ${c} arch=${arch}"
              spack install ${tpl} @ ${v} % ${c} arch=${arch}

              spack clean --all
            done
done

date
