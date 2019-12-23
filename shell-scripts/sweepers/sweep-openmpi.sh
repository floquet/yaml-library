#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export compiler="gcc@7.2.0"
export tpl="silo"
export versions="4.10.2-bsd  4.10.2  4.9  4.8"
export arch=$(spack arch)

for v in ${versions}; do
    echo ""
    echo "spack install ${tpl} @ ${v} % ${compiler} arch=${arch}"
          spack install ${tpl} @ ${v} % ${compiler} arch=${arch}

          spack clean --all
done

date
