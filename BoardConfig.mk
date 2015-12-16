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

include device/sony/yukon/BoardConfig.mk
include device/sony/eagle/BoardConfigTWRP.mk

TARGET_BOOTLOADER_BOARD_NAME := D2303

# Assert
TARGET_OTA_ASSERT_DEVICE := D2303,D2305,D2306,eagle,eagle_lte

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := mkqcdtbootimg
BOARD_CUSTOM_BOOTIMG_MK := device/sony/eagle/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dt_dir $(OUT)/dtbs --dt_version 2

TARGET_RECOVERY_FSTAB = device/sony/eagle/rootdir/fstab.yukon

BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1962934272
#Reserve space for data encryption (5461000192-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5460983808
BOARD_KERNEL_CMDLINE += mem=1003M
