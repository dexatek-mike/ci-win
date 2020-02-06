#!/bin/bash
#set -x

PROJ_ROOT=`pwd`
PATH_FLASH_TOOL=$PROJ_ROOT/flash_tool_win
PATH_UTILS=$PROJ_ROOT/utils
PATH=$PATH:$PATH_FLASH_TOOL:$PATH_UTILS

# programming settings for RTK flash tool to generate images
DFT_IMG=ram_all.bin
OTA_IMG=ota.bin
MP_IMG=mp_ota.bin
OTA_IMG_OFFSET=0xfb000
#CAL_IMG=A000.dat
CAL_IMG=
OUT_IMG=flash.bin
DFT_BOOT=dftimg
# programming settings for RTK flash tool to download images
# 1MB|2MB|4MB|8MB|16MB|32MB|64MB
PROG_FLASH_SIZE=4MB
PROG_BIN_FILE=flash.bin
PROG_VERIFY=true
PROG_KEEP_CAL=true
PROG_KEEP_CAL_OFFSET=0x0
PROG_AUTO_RESET=false

pushd $PATH_FLASH_TOOL
cp $PROJ_ROOT/ota.bin $PROJ_ROOT/ram_all.bin -r .
cmd "/C 7z x JLink_V494.7z"
# generate flash images
ImageTool.exe -generate dftimg=$DFT_IMG otaimg=$OTA_IMG,offset=$OTA_IMG_OFFSET calimg=$CAL_IMG outimg=$OUT_IMG dftboot=$DFT_BOOT
cp $OUT_IMG -r $PROJ_ROOT
popd
