#!/bin/bash
printf '%s\n' "**  **  **  $(date) ${BASH_SOURCE[0]}"
# dantopa@cn801:howard.arm.spack $ gcc --version
# gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-36)

export l_compilers=""
## clang
l_compilers="${l_compilers} clang@7.0.0  clang@6.0.1  clang@5.0.1  clang@4.0.1  clang@3.9.1"
## intel
l_compilers="${l_compilers} intel@18.0.2  intel@17.0.4"
## gcc
l_compilers="${l_compilers} gcc@8.2.0  gcc@8.1.0"
l_compilers="${l_compilers} gcc@7.3.0  gcc@7.2.0  gcc@7.1.0"
l_compilers="${l_compilers} gcc@6.4.0  gcc@6.3.0"
l_compilers="${l_compilers} gcc@5.5.0"
l_compilers="${l_compilers} gcc@4.9.3  gcc@4.8.5"
## pgi
l_compilers="${l_compilers} pgi@18.7  pgi@16.10"

census=( ${l_compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${l_compilers}"
echo ""

# dantopa@sn140.localdomain:spack.standard.zoltan $ spack compilers
# ==> Available compilers
# -- clang rhel7-x86_64 -------------------------------------------
# clang@7.0.0  clang@6.0.1  clang@5.0.1  clang@4.0.1  clang@3.9.1

# -- gcc rhel7-x86_64 ---------------------------------------------
# gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@7.2.0  gcc@7.1.0  gcc@6.4.0  gcc@6.3.0  gcc@5.5.0  gcc@4.9.3  gcc@4.8.5

# -- intel rhel7-x86_64 -------------------------------------------
# intel@18.0.2  intel@17.0.4

# -- pgi rhel7-x86_64 ---------------------------------------------
# pgi@18.7  pgi@16.10
