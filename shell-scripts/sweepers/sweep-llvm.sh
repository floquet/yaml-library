#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="llvm"
export versions=" 7.0.0  6.0.1  6.0.0  5.0.2  5.0.1  5.0.0  4.0.1  4.0.0  3.9.1"
export arch=$(spack arch)

for v in ${versions}; do
    echo ""
    echo "spack install ${tpl} @ ${v} % ${gcc_system_compiler} arch=${arch}"
          spack install ${tpl} @ ${v} % ${gcc_system_compiler} arch=${arch}

    echo ""
    echo "spack compiler find $(spack location --install-dir ${tpl} @ ${v})"
          spack compiler find $(spack location --install-dir ${tpl} @ ${v})

          spack clean --all
done

date
