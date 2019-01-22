#!/bin/bash
printf '%s\n' "**  **  **  $(date) ${BASH_SOURCE[0]}"
# dantopa@cn600:scripts $ gcc --version
# gcc (GCC) 6.4.0

export l_compilers=""
## intel
l_compilers="${l_compilers} intel@19.0.1.144  intel@18.0.3  intel@17.0.6"
## gcc
l_compilers="${l_compilers} gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@6.4.0"
## pgi
l_compilers="${l_compilers} pgi@18.7  pgi@17.10  pgi@16.10"

census=( ${l_compilers} )
echo "${#census[@]} Spack-recognized compilers loaded:"
echo "${l_compilers}"
echo ""

# dantopa@cn600:scripts $ pwd
# /scratch/users/dantopa/new-spack/spack.darwin.general-0.12.1/scripts

# dantopa@cn600:scripts $ date
# Tue Jan 22 12:57:21 MST 2019

# dantopa@cn600:scripts $ spack compilers
# ==> Available compilers
# -- gcc centos7-x86_64 -------------------------------------------
# gcc@8.2.0  gcc@8.1.0  gcc@7.3.0  gcc@6.4.0
#
# -- intel centos7-x86_64 -----------------------------------------
# intel@19.0.1.144  intel@18.0.3  intel@17.0.6
#
# -- pgi centos7-x86_64 -------------------------------------------
# pgi@18.7  pgi@17.10  pgi@16.10
