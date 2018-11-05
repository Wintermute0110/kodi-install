## Compile and install Kodi on Debian/Ubuntu distributions ##

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
$ /home/kodi/bin-kodi/kodi

$ /home/kodi/bin-kodi/kodi-standalone

$ /home/kodi/bin-kodi/lib/kodi/kodi-x11
```

The actual Kodi executable is `/home/kodi/bin-kodi/lib/kodi/kodi-x11`. The
other two executables are shell scripts that call the Kodi executable.


### Cloning this repository ###

If you don't have `git` installed then execute as `root`
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


### Clone and prepare Kodi source code ###

As the `kodi` user clone the Kodi source code. This will take a while:
```
$ cd /home/kodi/
$ git clone https://github.com/xbmc/xbmc.git kodi-source
```

If you want to compile a particular version of Kodi first have a look at the
tags in the repository:
```
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
$ git checkout 17.6-Krypton
```

The Kodi source code is now ready for compilation.


### Compile and installing Kodi for the first time ###

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

To compile all the binary addons:
```
$ ./build-binary-addons-all.sh
```

or instead execute this if you are not going to use Kodi personal video
recorder (PVR) features. This command compiles all binary addons except
the PVR addons:
```
$ ./build-binary-addons-selected.sh
```

Finally, to install Kodi, the Kodi binary addons and the required runtime
files like the default skin execute:
```
$ ./install-kodi.sh
```

The first time you execute Kodi the userdata directory `/home/.kodi/` will be created.

### Update Kodi ###

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
$ ./build-binary-addons-selected.sh
$ ./install-kodi.sh
```
