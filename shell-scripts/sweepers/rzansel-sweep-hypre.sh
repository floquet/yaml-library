#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="hypre"
export versions="2.15.1  2.15.0  2.14.0"
export compilers="pgi@18.10  pgi@18.7  pgi@18.5  pgi@18.3  pgi@18.2  pgi@18.2  pgi@18.1"

cd /usr/workspace/wsrzc/topa1/spack-home/spack.rzansel.hypre
. share/spack/setup-env.sh

export arch=$(spack arch)
export ompi=" ^openmpi@3.1.3 "

spack clean --all

for c in ${compilers}; do
    for v in ${versions}; do
        echo ""
        echo "spack install ${tpl} @ ${v} % ${c} ${ompi} arch=${arch}"
              spack install ${tpl} @ ${v} % ${c} ${ompi} arch=${arch}

              spack clean --all
            done
done

date
