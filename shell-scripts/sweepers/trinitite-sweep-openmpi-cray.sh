#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

export tpl="openmpi"
export versions="4.0.0 3.1.3 3.1.2 3.0.3"

# dantopa@nid00024:howard.ompi.cray $ spack compilers
#==> Available compilers
# -- cce cnl6-any -------------------------------------------------
# cce@9.0.0.21673  cce@9.0.0.21672  cce@8.7.6
export compilers="cce@9.0.0.21673  cce@9.0.0.21672  cce@8.7.6"

export arch=$(spack arch)

for c in ${compilers}; do
    for v in ${versions}; do
        echo ""
        echo "spack install ${tpl} @ ${v} % ${c} arch=${arch} ^libpciaccess%gcc@6.3.0"
              spack install ${tpl} @ ${v} % ${c} arch=${arch} ^libpciaccess%gcc@6.3.0

              spack clean --all
    done
done

date
