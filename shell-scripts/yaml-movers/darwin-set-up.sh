#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

function duplicator(){
    for a in ${arch}; do
        for t in ${tpl}; do
            echo "cp ${dir_yaml_library}/${1} ${dir_libraries}/${hpc}-${a}.${t}/etc/spack/defaults/."
        done
    done
}

export  hpc="darwin"
export arch="arm general power9"
export  tpl="openmpi libhio pmix"

export dir_yaml_library="/scratch/users/dantopa/repos/github/yaml-library"
export        dir_spack="/scratch/users/dantopa/new-spack"
export    dir_libraries="${dir_spack}/libraries"

duplicator $from $to
