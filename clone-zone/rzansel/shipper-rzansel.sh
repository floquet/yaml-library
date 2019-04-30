#! /bin/bash
printf '%s\n' "$(date) $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

target_dir="${SPACK_ROOT}/etc/spack/defaults"

function copier(){
    echo ""
    echo "cp ${1}.yaml ${target_dir}"
          cp ${1}.yaml ${target_dir}
}

function rename(){
    echo ""
    echo "mv ${target_dir}/${1}.yaml ${target_dir}/${2}.yaml"
         "mv ${target_dir}/${1}.yaml ${target_dir}/${2}.yaml"
}

export list_yaml="compilers lmod-modules tcl-modules mirrors packages system-compilers"

# move yaml files to $SPACK_ROOT
for y in ${list_yaml}; do
    copier ${y}
done

# renames
rename tcl-modules      modules
rename system-compilers compilers

echo ""
echo "ls -alh ${target_dir}"
      ls -alh ${target_dir}
