#! /bin/bash
printf '%s\n' "$(date) ${BASH_SOURCE[0]}"

# navigate to spack directory
# export spack_compiler="gcc@8.20"
export spack_compiler=${gcc_system_compiler}

spack install calico@2           % ${spack_compiler}

spack install cmake@3.14.4       % ${spack_compiler}
spack install cmake@3.13.4       % ${spack_compiler}
spack install cmake@3.12.4       % ${spack_compiler}
spack install cmake@3.11.4       % ${spack_compiler}
spack install cmake@3.10.3       % ${spack_compiler}

spack install eospac@6.4.0beta.2 % ${spack_compiler}
spack install eospac@6.4.0beta.4 % ${spack_compiler}
spack install eospac@6.4.1alpha  % ${spack_compiler}

spack install fftw@3.3.8         % ${spack_compiler}
spack install fftw@3.3.6-pl2     % ${spack_compiler}

spack install googletest@1.8.1   % ${spack_compiler}
spack install googletest@1.7.0   % ${spack_compiler}

spack install hdf5 1.10.5        % ${spack_compiler}
spack install hdf5 1.10.2        % ${spack_compiler}

spack install hypre 2.15.1       % ${spack_compiler}
spack install hypre 2.11.2       % ${spack_compiler}
spack install hypre 2.11.1       % ${spack_compiler}
spack install hypre 2.10.0b      % ${spack_compiler}

spack install kokkos 2.8.00      % ${spack_compiler}
spack install kokkos 2.7.24      % ${spack_compiler}
spack install kokkos 2.7.00      % ${spack_compiler}

spack install libhio@1.4.1.2     % ${spack_compiler}
spack install libhio@1.4.1.3     % ${spack_compiler}

spack install openblas@0.3.6     % ${spack_compiler}
spack install openblas@0.2.20    % ${spack_compiler}

spack install openmpi@3.0.4      % ${spack_compiler}
spack install openmpi@3.1.4      % ${spack_compiler}
spack install openmpi@4.0.1      % ${spack_compiler}

spack install pfunit@3.2.9       % ${spack_compiler}

spack install silo@4.10.2-bsd    % ${spack_compiler}
spack install silo@4.9           % ${spack_compiler}

spack install sundials@3.10.0    % ${spack_compiler}

spack install sundials@4.1.0     % ${spack_compiler}
spack install sundials@4.0.1     % ${spack_compiler}
spack install sundials@3.2.1     % ${spack_compiler}
spack install sundials@3.2.0     % ${spack_compiler}
spack install sundials@3.1.2     % ${spack_compiler}
