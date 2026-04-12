# AnyKernel3 Ramdisk Mod Script

### AnyKernel Setup
# Global properties
properties() { '
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # End properties

### AnyKernel Install
# Shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;
NO_BLOCK_DISPLAY=1

# Import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# Select the correct image to flash
userflavor="$(file_getprop /system/build.prop "ro.build.flavor")";
case "$userflavor" in
    missi*|qssi*) os="miui"; os_string="MIUI ROM";;
    *) os="aosp"; os_string="AOSP ROM";;
esac;
ui_print "  -> $os_string is detected!";
mv $AKHOME/kernels/Image $AKHOME/Image;

# Boot install
split_boot;
flash_boot;
# End boot install
