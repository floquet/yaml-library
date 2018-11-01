#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="gcc"
export versions="8.2.0 8.1.0 7.3.0 7.2.0 7.1.0 6.4.0 5.5.0 4.9.3"
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
