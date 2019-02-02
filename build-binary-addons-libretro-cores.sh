#!/bin/bash

# Builds selected Libretro cores for Kodi.
# Uses special repository for game addons

# --- Define useful functions ---
compile_core () {
    echo "Compiling core $1 ..."
    num_proc=`nproc`
    echo "Using $num_proc processors"
    cd /home/kodi/kodi-source
    rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
    make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="$1"
}

# --- Configure Kodi repository for Libretro cores ---
repofname="/home/kodi/kodi-source/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/kodi-game/repo-binary-addons.git retroplayer"
rm -f $repofname
# -n no trailing newline
echo -n $bin_addons_repo >> $repofname

# --- Build the addons ---
# --- Uncomment the cores you want to build. Cores are sorted alphabetically.
# --- For a list of all cores see http://mirrors.kodi.tv/addons/leia/
# --- and look for the game.libretro.* addons.
# compile_core game.libretro.2048
# compile_core game.libretro.4do
compile_core game.libretro.beetle-bsnes
# compile_core game.libretro.beetle-gba
# compile_core game.libretro.beetle-lynx
# compile_core game.libretro.beetle-ngp
compile_core game.libretro.beetle-pce-fast
compile_core game.libretro.beetle-pcfx
compile_core game.libretro.beetle-psx
# compile_core game.libretro.beetle-saturn
# compile_core game.libretro.beetle-supergrafx
# compile_core game.libretro.beetle-vb
# compile_core game.libretro.beetle-wswan
# compile_core game.libretro.bluemsx
compile_core game.libretro.bnes
compile_core game.libretro.bsnes-mercury-accuracy
compile_core game.libretro.bsnes-mercury-balanced
compile_core game.libretro.bsnes-mercury-performance
# compile_core game.libretro.cap32
compile_core game.libretro.desmume
# compile_core game.libretro.dinothawr
compile_core game.libretro.dosbox
# compile_core game.libretro.fbalpha
# compile_core game.libretro.fbalpha2012
compile_core game.libretro.fceumm
# compile_core game.libretro.fmsx
# compile_core game.libretro.fuse
compile_core game.libretro.gambatte
compile_core game.libretro.genplus
compile_core game.libretro.gw
# compile_core game.libretro.handy
# compile_core game.libretro.hatari
# compile_core game.libretro.lutro
# --- Careful with the MAME cores. Each one takes 1 hour to compile on a fast machine!
# compile_core game.libretro.mame2000
# compile_core game.libretro.mame2003
# compile_core game.libretro.mame2003_plus
# compile_core game.libretro.melonds
# compile_core game.libretro.meteor
# compile_core game.libretro.mgba
# compile_core game.libretro.mrboom
# --- Mupen64plus seems to only work on Windows
# compile_core game.libretro.mupen64plus
compile_core game.libretro.nestopia
# compile_core game.libretro.nx
# compile_core game.libretro.o2em
# compile_core game.libretro.pcsx-rearmed
compile_core game.libretro.picodrive
# compile_core game.libretro.pokemini
# compile_core game.libretro.prboom
# compile_core game.libretro.prosystem
# compile_core game.libretro.quicknes
# compile_core game.libretro.sameboy
# compile_core game.libretro.scummvm
# compile_core game.libretro.snes9x
# compile_core game.libretro.snes9x2002
# compile_core game.libretro.snes9x2010
# compile_core game.libretro.stella
# compile_core game.libretro.tgbdual
# compile_core game.libretro.tyrquake
# compile_core game.libretro.uae
# compile_core game.libretro.vba-next
# compile_core game.libretro.vbam
# compile_core game.libretro.vecx
# compile_core game.libretro.vice
# compile_core game.libretro.virtualjaguar
# compile_core game.libretro.yabause
