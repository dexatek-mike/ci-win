#!/bin/bash
#set -x

# programming settings for RTK flash tool to generate images
DFT_IMG=ram_all.bin
OTA_IMG=ota.bin
MP_IMG=mp_ota.bin
OTA_IMG_OFFSET=0xfb000
CAL_IMG=A000.dat
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

# generate flash images
ImageTool.exe -generate dftimg=$DFT_IMG otaimg=$OTA_IMG,offset=$OTA_IMG_OFFSET calimg=$CAL_IMG outimg=$OUT_IMG dftboot=$DFT_BOOT
