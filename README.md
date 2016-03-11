# sailfishbackup
**BETA** backup system for Moto G 1st edition (2013) SailfishOS port

## What can I back with this?

- Repos from Openrepos already enabled.

- Packages from Openrepos already installed.

- Config files from those packages (not the best system; if you take a look on the code you'll know why).

- Backup made by settings utility.

## How to use it?

Pretty simple:

### Backup

- Make backup from settings utility.

- Copy scripts to '/home/nemo'

- Change permission to scripts so you can execute them.

- Run as **root ** DisableSlowRepos.sh:
> \# ./DisableSlowRepos.sh

- Run as **nemo** Backup.sh:
> $ ./Backup.sh

This will generate a file called **fullbackup.tar** with all your files. Copy this file outside the phone with scp or something.

- If you are going keep using the phone (not flashing) notice there is a few repos disable. Run as **root** EnableSlowRepos.sh to put everything back (this may take a bit):

> \# ./EnableSlowRepos.sh

### Restore

- Copy the fullbackup.tar file to '/home/nemo'.

- Copy scripts to '/home/nemo'

- Change permission to scripts so you can execute them.

- Run as **nemo** Restore.sh:
> $ ./Restore.sh

- Run as **root ** DisableSlowRepos.sh:
> \# ./DisableSlowRepos.sh

- Run as **root ** Reinstall.sh (this may take a bit):
> \# ./Reinstall.sh

- Run as **root ** Reinstall.sh (this may take a bit):
> \# ./EnableSlowRepos.sh

- Run restore utility from settings.

## FAQ

###  Why don't you use sudo?
Because it needs to be installed which is not by default. Indeed it would be much easier all this; just a couple of scripts.

### Why do you disable and enable Jolla's repos?
Because I found them to slow down zypper A LOT. Besides that, on backup If they are not disabled, you cannot get what packages you installed from Openrepos.

### I've lost some config files
Although I do not guarantee this scripts do work flawlessly, may have some errors. Check your *mybackup.tar* file. There should be two plain text files (with packages installed and repos enabled, and two tar files with .vault content and ~/.local/share/harbour-* folders)

### Save just harbour-* folders is a crappy method
You are right. If you code a better one I'll be glad to merge your PR.

### Anything else
Feel free to open an issue.

## License

**sailfishbackup**  Copyright (C) 2016  J. Pablo Navarro
This program comes with ABSOLUTELY NO WARRANTY; for details look on license file. 
This is free software, and you are welcome to redistribute it under certain conditions; look on license file for details.