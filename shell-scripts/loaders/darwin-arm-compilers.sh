#!/bin/bash
printf '%s\n' "**  **  **  $(date) ${BASH_SOURCE[0]}"
# dantopa@cn801:howard.arm.spack $ gcc --version
# gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-36)

export l_compilers=""
## armclang
l_compilers="${l_compilers} clang@18.4.2  clang@18.4.1  clang@18.4"
## armclang
l_compilers="${l_compilers} gcc@8.2.0  gcc@8.1.0"
l_compilers="${l_compilers} gcc@7.3.0  gcc@7.2.0  gcc@7.1.0"
l_compilers="${l_compilers} gcc@6.4.0"
l_compilers="${l_compilers} gcc@5.5.0"
l_compilers="${l_compilers} gcc@4.9.3  gcc@4.8.5"

census=( ${l_compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${l_compilers}"
echo ""
