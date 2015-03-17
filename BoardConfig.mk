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

include device/sony/msm8226-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := D2303

#RECOVERY_VARIANT := philz

TARGET_OTA_ASSERT_DEVICE := D2302,D2303,D2305,D2306,eagle,eagle_lte

# Kernel properties
TARGET_PREBUILT_KERNEL := device/sony/eagle/prebuilt/kernel

TARGET_SPECIFIC_HEADER_PATH += device/sony/eagle/include

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/eagle/bluetooth

TARGET_BOARD_PLATFORM := msm8226

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1962934272 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5460983808
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_VOLD_MAX_PARTITIONS := 26

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

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/eagle/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
