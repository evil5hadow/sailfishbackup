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

# Create backup folder
function CreateBackupFolder {
  echo "Creating a backup folder"
  cd /home/nemo
  mkdir mybackup
  echo "    Done"
}

# Create a list with packages installed from Openrepos
function CreateInstalledList {
  echo "Creating a installed packages list..."
  cd /home/nemo/mybackup
  zypper pa | grep "i |" | awk '{print $5}' > mypackages
  echo "    Done"
}

function CreateRepoList {
  echo "Creating repo list..."
  cd /home/nemo/mybackup
  zypper lr | grep "openrepos" | tr "-" " " | awk '{print $7}' > repolist
  echo "    Done"

}

# Tar apps files. I know not all of them starts by "harbour-"
# but I don't know how to improve this. Any help is appreciated.
function TarAppsFiles {
  echo "Saving apps files..."
  cd /home/nemo/.local/share
  tar -cf appsfiles.tar harbour-*
  mv appsfiles.tar /home/nemo/mybackup
  echo "    Done"
}

function TarVault {
  echo "Saving vault..."
  cd /home/nemo/
  tar -cf vault.tar .vault
  mv vault.tar mybackup
  echo "    Done"
}

function CreateFullBackup {
  echo "Creating full backup..."
  cd /home/nemo/
  tar -cf fullbackup.tar mypackages appsfiles.tar vault.tar
  echo "    Done: fullbackup.tar created."
}

function Clean {
  echo "Cleaning..."
  cd /home/nemo/
  rm -r mybackup
  echo "    Done"
}


# --- Main ---

ShowLicense
CreateBackupFolder
CreateInstalledList
TarAppsFiles
TarVault
CreateFullBackup
Clean
