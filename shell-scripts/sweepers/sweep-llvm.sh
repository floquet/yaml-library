#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="llvm"
export versions=" 8.0.0  7.0.1  6.0.1  5.0.2  5.0.1  4.0.1  3.9.1"
export arch=$(spack arch)

for v in ${versions}; do
    echo ""
    echo "spack install ${tpl} @ ${v} % ${1} arch=${arch}"
          spack install ${tpl} @ ${v} % ${1} arch=${arch}

    echo ""
    echo "spack compiler find $(spack location --install-dir ${tpl} @ ${v})"
          spack compiler find $(spack location --install-dir ${tpl} @ ${v})

          spack clean --all
done

date
