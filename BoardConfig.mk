# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
USE_CAMERA_STUB := false

# inherit from Sony common
include device/sony/common/BoardConfigCommon.mk

# inherit from qcom-common
include device/sony/qcom-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := D2302,D2303,D2305,D2306,eagle,eagle_ds,eagle_lte

#RECOVERY_VARIANT := twrp

TARGET_SPECIFIC_HEADER_PATH += device/sony/eagle/include

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_BOARD_PLATFORM := msm8226
BOARD_VENDOR_PLATFORM := eagle

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/eagle
TARGET_KERNEL_CONFIG := eagle_lte_defconfig

# Kernel information
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M zcache
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_CUSTOM_MKBOOTIMG  := mkqcdtbootimg
BOARD_CUSTOM_BOOTIMG_MK := device/sony/eagle/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
TARGET_DTB_EXTRA_FLAGS := --force-v2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Qualcomm
BOARD_USES_QC_TIME_SERVICES := true

# Filesystem
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p26
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_DATA_DEVICE := /dev/block/mmcblk0p29
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p27
BOARD_CACHE_FILESYSTEM := ext4
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_HAS_NO_MISC_PARTITION := true

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1962934272 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5460983808
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 26
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_RECOVERY_FSTAB  := device/sony/eagle/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_NO_MSM_BSP := true

# TWRP flags
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_JB_CRYPTO := false
TW_INCLUDE_L_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_NO_USB_STORAGE := true
TW_EXCLUDE_MTP := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
