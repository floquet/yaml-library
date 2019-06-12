#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

SECONDS=0
export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results

# counts steps in batch process
function new_step(){
    counter=$((counter+1))
    echo ""
    echo "Step ${counter}: ${1}"
}

export dir_xrage_spack="/scratch/users/dantopa/repos/spack/xrage/${partition}"
export       dir_artab="/usr/projects/artab/users/dantopa/spack-tarballs"

new_step "Navigate to spack directory"
cd "${dir_xrage_spack}"
cd "${host_name}-${partition}-xrage.spack"
echo "\$(pwd)             = $(pwd)"
echo "\${dir_artab}       = ${dir_artab}"
echo "\${dir_xrage_spack} = ${dir_xrage_spack}"

new_step "Initialize spack for bash"
echo ". share/spack/setup-env.sh"
      . share/spack/setup-env.sh

new_step "Clean caches"
echo "spack clean --all"
      spack clean --all

new_step "Record current state"
echo "mkdir -p topa"
      mkdir -p topa
echo "spack find -ldf > topa/spack-find-ldf.txt"
      spack find -ldf > topa/spack-find-ldf.txt
echo "spack find      > topa/spack-find.txt"
      spack find      > topa/spack-find.txt

export configs="compilers mirrors modules packages"
for c in ${configs}; do
    echo "spack config blame ${c} > topa/config-${c}.txt"
          spack config blame ${c} > topa/config-${c}.txt
done

echo "module avail > topa/module-avail.txt"
      module avail > topa/module-avail.txt

new_step "Make tarball"
echo "cd .."
      cd ..
echo 'tar --exclude=".*" -czvf ${host_name}-${partition}-${ymd}.tgz ${host_name}-${partition}-xrage.spack > tar-file-list.txt'
      tar --exclude=".*" -czvf ${host_name}-${partition}-${ymd}.tgz ${host_name}-${partition}-xrage.spack > tar-file-list.txt

new_step "Post tarball to $dir_artab"
echo "cp '${host_name}-${partition}-${ymd}.tgz' '${dir_artab}'"
      cp "${host_name}-${partition}-${ymd}.tgz" "${dir_artab}"

new_step "Exit"
echo "time used = ${SECONDS} s"
