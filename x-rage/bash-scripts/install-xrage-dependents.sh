#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

# navigate to spack directory
# export spack_compiler="gcc@8.20"
# export spack_compiler=${gcc_system_compiler}
export spack_compiler=${1}
echo ""
echo "\${spack_compiler} = ${spack_compiler}"

spack ${faust} install calico@2           % ${spack_compiler}

echo ""; echo "eospac"
spack ${faust} install eospac@6.4.0       % ${spack_compiler}
spack ${faust} install eospac@6.3.1       % ${spack_compiler}
# spack ${faust} install eospac@6.4.1alpha  % ${spack_compiler}

echo ""; echo "openmpi"
spack ${faust} install openmpi@3.0.4      % ${spack_compiler}
spack ${faust} install openmpi@3.1.4      % ${spack_compiler}
spack ${faust} install openmpi@4.0.1      % ${spack_compiler}

echo ""; echo "hypre"
spack ${faust} install fftw@3.3.8         % ${spack_compiler}
spack ${faust} install fftw@3.3.6-pl2     % ${spack_compiler}

echo ""; echo "googletest"
spack ${faust} install googletest@1.8.1   % ${spack_compiler}
spack ${faust} install googletest@1.7.0   % ${spack_compiler}

echo ""; echo "hdf5"
spack ${faust} install hdf5@1.10.5        % ${spack_compiler}
spack ${faust} install hdf5@1.10.2        % ${spack_compiler}

echo ""; echo "hypre"
spack ${faust} install hypre@2.15.1       % ${spack_compiler}
spack ${faust} install hypre@2.11.2       % ${spack_compiler}
spack ${faust} install hypre@2.11.1       % ${spack_compiler}
spack ${faust} install hypre@2.10.0b      % ${spack_compiler}

echo ""; echo "kokkos"
spack ${faust} install kokkos@2.8.00      % ${spack_compiler}
spack ${faust} install kokkos@2.7.24      % ${spack_compiler}
spack ${faust} install kokkos@2.7.00      % ${spack_compiler}

echo ""; echo "libhio"
spack ${faust} install libhio@1.4.1.2     % ${spack_compiler}
spack ${faust} install libhio@1.4.1.3     % ${spack_compiler}

echo ""; echo "netlib-lapack"
spack ${faust} install netlib-lapack@3.8.0 % ${spack_compiler}
spack ${faust} install netlib-lapack@3.7.1 % ${spack_compiler}

echo ""; echo "openblas"
spack ${faust} install openblas@0.3.6     % ${spack_compiler}
spack ${faust} install openblas@0.2.20    % ${spack_compiler}

echo ""; echo "pfunit"
spack ${faust} install pfunit@3.3.3       % ${spack_compiler}
spack ${faust} install pfunit@3.2.10      % ${spack_compiler}
spack ${faust} install pfunit@3.2.9       % ${spack_compiler}

echo ""; echo "silo"
spack ${faust} install silo@4.10.2-bsd    % ${spack_compiler}
spack ${faust} install silo@4.9           % ${spack_compiler}

echo ""; echo "sundials"
spack ${faust} install sundials@4.1.0     % ${spack_compiler}
spack ${faust} install sundials@3.1.2     % ${spack_compiler}

date
