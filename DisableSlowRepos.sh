#!/bin/bash

#     Backup files from MotoG SailfishOS port.
#     Copyright (C) 2016  J. Pablo Navarro
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function ShowLicense {
echo "sailfishbackup  Copyright (C) 2016  J. Pablo Navarro. This program comes with ABSOLUTELY NO WARRANTY; for details look on license file. This is free software, and you are welcome to redistribute it under certain conditions; look on license file for details."
}

function CheckRoot
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

ShowLicense
CheckRoot
echo "Disabling slow repos..."
prefix="/etc/zypp/repos.d"
mv $prefix/ssu_adaptation0_release.repo $prefix/ssu_adaptation0_release.repo.bk
mv $prefix/ssu_apps_release.repo $prefix/ssu_apps_release.repo.bk
mv $prefix/ssu_hotfixes_release.repo $prefix/ssu_hotfixes_release.repo.bk
mv $prefix/ssu_jolla_release.repo $prefix/ssu_jolla_release.repo.bk
mv $prefix/ssu_store_release.repo $prefix/ssu_store_release.repo.bk
zypper refresh
echo "    Done"
