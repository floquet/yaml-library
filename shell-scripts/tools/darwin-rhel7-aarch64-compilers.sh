#!/bin/bash
printf '%s\n' "**  **  **  $(date) ${BASH_SOURCE[0]}"
# dantopa@cn600:scripts $ gcc --version
# gcc (GCC) 6.4.0

export l_compilers=""
## ARM clang
l_compilers="${l_compilers} clang@18.4.2  clang@18.4.1  clang@18.4.0"
## clang
l_compilers="${l_compilers} clang@7.0.0  clang@6.0.1  clang@6.0.0"
## gcc
l_compilers="${l_compilers} gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@7.2.0  gcc@7.1.0  gcc@6.4.0"

census=( ${l_compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${l_compilers}"
echo ""

# dantopa@cn804:spack.darwin.arm-0.12.1 $ date
# Tue Jan 22 13:11:07 MST 2019

# dantopa@cn804:spack.darwin.arm-0.12.1 $ pwd
# /scratch/users/dantopa/new-spack/spack.darwin.arm-0.12.1

# dantopa@cn804:spack.darwin.arm-0.12.1 $ spack compilers
# ==> Available compilers
# -- clang rhel7-aarch64 ------------------------------------------
# clang@18.4.2  clang@18.4.1  clang@18.4.0  clang@7.0.0  clang@6.0.1  clang@6.0.0  clang@5.0.2  clang@5.0.1  clang@5.0.0  clang@4.0.1  clang@3.9.1
#
# -- gcc rhel7-aarch64 --------------------------------------------
# gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@7.2.0  gcc@7.1.0  gcc@6.4.0  gcc@5.5.0  gcc@4.9.3  gcc@4.8.5
