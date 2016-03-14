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
echo "sailfishbackup  Copyright (C) 2016  J. Pablo Navarro \n This program comes with ABSOLUTELY NO WARRANTY; for details look on license file. \n     This is free software, and you are welcome to redistribute it \n under certain conditions; look on license file for details.\n"
}

# Untar fullbackup.tar
function UnTarBackup {
echo "Untaring the file..."
cd /home/nemo
tar -xf fullbackup.tar
echo "    Done"
}

# Restore vault
function RestoreVault {
echo "Restoring vault..."
cd /home/nemo/mybackup
tar -xpf vault.tar -C ..
echo "    Done"
}

# Restore appsfile
function RestoreAppsFiles {
echo "Restoring apps files"
cd /home/nemo/mybackup
tar -xpf appsfiles.tar -C /home/nemo/.local/share/.
echo "    Done"
}



# --- Main ---

ShowLicense
UnTarBackup
RestoreVault
RestoreAppsFiles
