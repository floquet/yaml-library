#! /bin/bash
printf '%s\n' "$(date) $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# ships to ${SPACK_ROOT}
# . shipper-rzansel.sh

target_dir="${SPACK_ROOT}/etc/spack/defaults"

function copier(){
    #echo "\${1} = ${1}"
    echo "cp ${1}.yaml ${target_dir}"
          cp ${1}.yaml ${target_dir}
}

function rename(){
    echo ""
    lss ${target_dir}/${1}.yaml
    echo "from: ${target_dir}/${1}.yaml"
    echo "to:   ${target_dir}/${2}.yaml"
    echo "cp ${target_dir}/${1}.yaml ${target_dir}/${2}.yaml"
         "cp ${target_dir}/${1}.yaml ${target_dir}/${2}.yaml"
}

export list_yaml="compilers lmod-modules tcl-modules mirrors packages system-compilers"

# move yaml files to $SPACK_ROOT
for y in ${list_yaml}; do
    # echo "yaml = ${y}"
    copier ${y}
done

# renames
echo ""
rename tcl-modules      modules
rename system-compilers compilers

echo ""
echo "ls -alh ${target_dir}"
      ls -alh ${target_dir}
