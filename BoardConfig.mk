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
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/sony/eagle/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := D2302,D2303,D2305,D2306,eagle,eagle_lte

RECOVERY_VARIANT := twrp

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_BOARD_PLATFORM := msm8226

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel properties
TARGET_KERNEL_CONFIG := eagle_lte_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/eagle/android_kernel_sony_eagle

# Kernel information
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

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
TARGET_RECOVERY_FSTAB  := device/sony/eagle/twrp.fstab
TARGET_RECOVERY_INITRC := device/sony/eagle/recovery/init.qcom.rc
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
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
