# Compile and install Kodi on Debian/Ubuntu distributions #

## Table of Contents

* **[Readme me first](#readme-me-first)**
* **[Cloning this repository](#cloning-this-repository)**
* **[Clone and prepare Kodi source code](#clone-and-prepare-kodi-source-code)**
* **[Compile and installing Kodi for the first time](#compile-and-installing-kodi-for-the-first-time)**
* **[Compiling the Kodi binary addons](#compiling-the-kodi-binary-addons)**
* **[Update Kodi](#update-kodi)**
* **[Notes](#notes)**
* **[Current bugs](#current-bugs)**

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

Do not purge the build directory before compiling the binary addons.


## Compiling the Kodi binary addons

To compile all the binary addons:
```
$ cd /home/kodi/KodiInstall
$ ./build-binary-addons-all.sh
```

or instead execute this if you are not going to use Kodi personal video
recorder (PVR) features. This command compiles all binary addons except
the PVR addons:
```
$ cd /home/kodi/KodiInstall
$ ./build-binary-addons-no-pvr.sh
```

the binary addons are automatically installed in `/home/kodi/bin-kodi/` after compilation.


To compile the Libretro cores (Kodi addons that let you play games) first edit the file
`/home/kodi/KodiInstall/build-binary-addons-libretro-cores.sh` and comment/uncomment 
the Libretro cores you want to build. Note that building **all** the cores takes about 5/6
hours on a fast machine. Each MAME core takes 1 hour! Build only the cores you plan to use.
```
# --- Build the addons ---
# --- Uncomment the cores you want to build. Cores are shorted alphabetically.
# --- For a list of all cores see http://mirrors.kodi.tv/addons/leia/
# --- and look for the game.libretro.* addons.
# compile_core game.libretro.2048
# compile_core game.libretro.4do
compile_core game.libretro.beetle-bsnes
# compile_core game.libretro.beetle-gba
...
```

Finally, compile the Libretro cores:
```
$ cd /home/kodi/KodiInstall
$ ./build-binary-addons-libretro-cores.sh
```

the Libretro cores addons are automatically installed in `/home/kodi/bin-kodi/` after compilation.


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
$ ./install-kodi.sh
$ ./build-binary-addons-no-pvr.sh
$ ./build-binary-addons-libretro-cores.sh
```

If you plan to update Kodi frequently then do not execute `purge-build-directory.sh` to save
compilation time (only files changed will be recompiled).


## Notes ##

 * Compiling the binary addons with `build-binary-addons-no-pvr.sh` installs them in
   `/home/kodi/bin-kodi/` even if Kodi has not been installed before.

 * The addons `game.controller.*` are not binary addons. They can be downloaded with the Kodi
   addon manager.

 * Kodi is built out-of-source but the binary addons are build inside the Kodi source.

 * Executing `build-binary-addons-no-pvr.sh` or `build-binary-addons-libretro-cores.sh`
   updates the binary addons source code if it has been changed?

 * After a fresh installation all the binary addons are **disabled**. They must be enabled
   in `Settings` -> `Addons` -> `My addons`.

 * If a Libretro core is not installed the extensions it supports are not shown in the
   Games source filesystem browser. Libretro core addons must installed/enabled first.


## Current bugs ##

 * If I execute any ROM I get the following dialog window "Add-on is incompatible due to
   unmet dependencies. Missing: game.controller.genesis.6button, game.controller.genesis.mouse"

   Kodi does not install `game.controller.*` addons automatically. Manually installing the
   addons solves the problem.

 * If there is no joystick plugged in then emulation does not start.

 * In the Kodi Wiki `https://kodi.wiki/view/Game_add-ons` the following `You will need to place 
   them into the System Directory (linux example for pcsx bios files: 
   ~/.kodi/userdata/addon_data/game.libretro.pcsx-rearmed/system/ ).` is wrong. The correct
   directory is `~/.kodi/userdata/addon_data/game.libretro.pcsx-rearmed/resources/system/`

 * If joystick is hot unplugged Kodi correctly detects that is has been unplugged and emulation
   does not start anymore. Interestingly, in Windows emulation starts when
   there is no gamepad, only keyboard.

```
22:46:37.511 T:140428854687488   ERROR: AddOnLog: Joystick Support: ScanEvents: failed to read joystick "Xbox 360 Wireless Receiver" on /dev/input/js0 - 19 (No such device)
22:46:38.921 T:140429205022464   ERROR: Previous line repeats 86 times.
22:46:38.921 T:140429205022464  NOTICE: UnregisterRemovedDevices - device removed from joystick/peripheral.joystick/0: Xbox 360 Wireless Receiver (0000:0000)
```

 * If joystick is hot plugged Kodi detects it OK. Emulation starts when a ROM is clicked.
   Interestingly, whenever a joystick is plugged emulation starts correctly even if
   controlling Kodi with the keyboard.

```
22:48:47.805 T:140429205022464  NOTICE: Register - new joystick device registered on addon->peripheral.joystick/1: Xbox 360 Wireless Receiver
```

 * Aspect ratio in core `beetle_psx` is wrong in Stretch mode Normal. Stretch mode 4:3 seems
   to work OK.

 * I cannot use the gamepad at all in `beetle_psx`, not even after remapping the controllers
   `PlayStation Dual Analog` and `PlayStation Dual Shock`.

 * Core `prboom` crashes if `prboom.wad` is not found. Kodi crashes as well.

 * Speed of `prboom` core is totally wrong. Core must be run at 35 FPS, otherwise speed is
   wrong. This problem also happens in Retroarch. A core that does frame interpolation like
   **Crispy Doom** or **PrBoom+** is required.
