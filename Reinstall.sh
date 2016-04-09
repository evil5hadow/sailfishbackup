#/bin/bash

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

function AddRepos {
echo "Adding repos..."
cd /home/nemo/mybackup
for repo in $(cat repolist);do
zypper ar -f http://sailfish.openrepos.net/$repo/personal-main.repo
done
zypper refresh
echo "    Done"
}

function ReinstallApps {
echo "Reinstalling apps..."
cd /home/nemo/mybackup
zypper install $(cat mypackages)
echo "    Done"
}


# --- Main ---

ShowLicense
AddRepos
ReinstallApps


echo "Do not forget run EnableSlowRepos.sh"
echo "Press any key to quit."
read

