## Compile and install Kodi on Debian/Ubuntu distributions ##

## Table of Contents

* **[Readme me first](ar)**
* **[Cloning this repository](ar)**
* **[Clone and prepare Kodi source code](ar)**
* **[Compile and installing Kodi for the first time](ar)
* **[Update Kodi](ar)

## Readme me first ##

These scripts assume that:

 * The user running Kodi is named `kodi`.
 
 * The home folder of the `kodi` user is `/home/kodi`.
 
 * Kodi source code is located in `/home/kodi/kodi-source/`.
 
 * Kodi temporary build directory is `/home/kodi/kodi-build/`. You can safely
   delete it once Kodi has been compiled and installed.

 * Kodi will be installed in the directory `/home/kodi/bin-kodi/`.

 * Kodi user data directory is `/home/.kodi/`.

Once compiled and installed, you can execute Kodi in several ways:
```
$ /home/kodi/bin-kodi/bin/kodi

$ /home/kodi/bin-kodi/bin/kodi-standalone

$ /home/kodi/bin-kodi/lib/kodi/kodi-x11
```

The actual Kodi executable is `/home/kodi/bin-kodi/lib/kodi/kodi-x11`. The
first two files are shell scripts that call the actual Kodi executable `kodi-x11`.


## Cloning this repository ##

If you don't have `git` installed then execute as `root` user:
```
# apt-get install git
```

To clone this repository:
```
$ cd /home/kodi
$ git clone https://github.com/Wintermute0110/KodiInstall.git
```

The Kodi compilation tools will be cloned into the directory 
`/home/kodi/KodiInstall/`.


## Clone and prepare Kodi source code ##

As the `kodi` user clone the Kodi source code. This will take a while:
```
$ cd /home/kodi/
$ git clone https://github.com/xbmc/xbmc.git kodi-source
```

If you want to compile a particular version of Kodi first have a look at the
tags in the repository:
```
$ cd /home/kodi/kodi-source/
$ git tag
...
16.0-Jarvis
17.0-Krypton
17.6-Krypton
18.0b4-Leia
18.0b5-Leia
18.0-Leia
...
$ 
```

Each tag corresponds to a released version of Kodi. Now, tell `git` to set the
Kodi source code to the version you want:
```
$ cd /home/kodi/kodi-source/
$ git checkout 17.6-Krypton
```

To compile the Retroplayer binary addons with the Libretro emulators (the
emulator **cores**), you need to edit the file `binary-addons.txt`. In this
example I use the editor `nano` but feel free to use whichever editor you
wish.
```
$ nano /home/kodi/kodi-source/cmake/addons/bootstrap/repositories/binary-addons.txt
```

The contents of `binary-addons.txt` should be:
```
binary-addons https://github.com/xbmc/repo-binary-addons.git master
```

Change by:
```
binary-addons https://github.com/kodi-game/repo-binary-addons.git retroplayer
```

The Kodi source code is now ready for compilation.


## Compile and installing Kodi for the first time ##

First you need to install the build dependencies required to compile Kodi.
As `root` execute:
```
# cd /home/kodi/KodiInstall
# ./install-build-dependencies-debian.sh
```

As the `kodi` user, the Kodi build directory needs to be configured
before compilation:
```
$ cd /home/kodi/KodiInstall
$ ./configure-kodi.sh
```

Now it's time to compile Kodi. This will take a while (about 15 minutes on a
fast computer):
```
$ ./build-kodi-x11.sh
```

The binary addons will take a long time to compile, much longer than
Kodi itself. The game addons take particularly long. To compile all
the binary addons:
```
$ ./build-binary-addons-all.sh
```

or instead execute this if you are not going to use Kodi personal video
recorder (PVR) features. This command compiles all binary addons except
the PVR addons:
```
$ ./build-binary-addons-no-pvr.sh
```

Finally, to install Kodi, the Kodi binary addons and the required runtime
files like the default skin execute:
```
$ ./install-kodi.sh
```

The first time you execute Kodi the userdata directory `/home/.kodi/` will be created.

Now that Kodi is installed you can safely delete the Kodi build directory to save disk space:
```
$ ./purge-build-directory.sh
```

## Update Kodi ##

Update Kodi source code:
```
$ cd /home/kodi-source/
$ git checkout master
$ git pull
```

If you wish to set a specific version:
```
$ git checkout 17.6-Krypton
```

Then configure, compile and install Kodi again:
```
$ cd /home/kodi/KodiInstall
$ ./configure-kodi.sh
$ ./build-kodi-x11.sh
$ ./clean-binary-addons.sh
$ ./build-binary-addons-no-pvr.sh
$ ./install-kodi.sh
```

If you plan to update Kodi frequently then do not execute `purge-build-directory.sh` to save
compilation time (only files changed will be recompiled).
