#!/bin/bash
printf '%s\n' "**  **  **  $(date) ${BASH_SOURCE[0]}"
# dantopa@cn2021:spack.darwin.power9-0.12.1 $ gcc --version
# gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-28)

export l_compilers=""
## intel
l_compilers="${l_compilers} clang@7.0.0"
## gcc
l_compilers="${l_compilers} gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@6.4.0  gcc@4.8.5"
## pgi
l_compilers="${l_compilers} pgi@18.10  pgi@18.7  pgi@17.10  pgi@16.10"
## xl
l_compilers="${l_compilers} xl@16.1"

census=( ${l_compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${l_compilers}"
echo ""

# dantopa@cn2021:spack.darwin.power9-0.12.1 $ date
# Tue Jan 22 14:32:28 MST 2019

# dantopa@cn2021:spack.darwin.power9-0.12.1 $ pwd
# /scratch/users/dantopa/new-spack/spack.darwin.power9-0.12.1

# dantopa@cn2021:spack.darwin.power9-0.12.1 $ spack compilers
# ==> Available compilers
# -- clang rhel7-ppc64le ------------------------------------------
# clang@7.0.0
#
# -- gcc rhel7-ppc64le --------------------------------------------
# gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@6.4.0  gcc@4.8.5
#
# -- pgi rhel7-ppc64le --------------------------------------------
# pgi@18.10  pgi@18.7  pgi@17.10  pgi@16.10
#
# -- xl rhel7-ppc64le ---------------------------------------------
# xl@16.1
#
# -- xl_r rhel7-ppc64le -------------------------------------------
# xl_r@16.1
