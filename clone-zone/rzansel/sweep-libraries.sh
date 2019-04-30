#! /bin/bash
printf '%s\n' "$(date) $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export tpls="libhio openmpi pmix ucx"

for t in ${tpls}; do
    echo 'export SPACK_ROOT="${repos}/spack/libraries/rzansel-power9.${t}"'
          export SPACK_ROOT="${repos}/spack/libraries/rzansel-power9.${t}"
    echo "source ${repos}Github/yaml-library/clone-zone/rzansel/shipper.sh"
          source ${repos}Github/yaml-library/clone-zone/rzansel/shipper.sh
done
