#! /bin/bash
printf '%s\n' "$(date) $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# intel-mpi

wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/14879/l_mpi_2019.1.144.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/13584/l_mpi_2019.0.117.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/13741/l_mpi_2018.4.274.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/13112/l_mpi_2018.3.222.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12748/l_mpi_2018.2.199.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12414/l_mpi_2018.1.163.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12120/l_mpi_2018.0.128.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12209/l_mpi_2017.4.239.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11595/l_mpi_2017.3.196.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11334/l_mpi_2017.2.174.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11014/l_mpi_2017.1.132.tgz &
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/9278/l_mpi_p_5.1.3.223.tgz &

wait

versions="2019.1.144 2019.0.117 2018.4.274 2018.3.222 2018.2.199 2018.1.163 2018.0.128 2017.4.239 2017.3.196 2017.2.174 2017.1.132"
for v in ${versions}; do
    mv "l_mpi_${v}.tgz" "intel-mpi-${v}.tgz"
done

date
