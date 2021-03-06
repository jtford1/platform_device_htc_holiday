# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Workarounds for ics compatibility	
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Audio
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DAUDIO_LEGACY
BOARD_USES_AUDIO_LEGACY := true
ICS_AUDIO_BLOB := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holiday

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=holiday no_console_suspend=1
BOARD_KERNEL_BASE := 0x48000000
BOARD_PAGE_SIZE := 2048

TARGET_PREBUILT_KERNEL := device/htc/holiday/prebuilt/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/holiday/recovery/recoverykernel
#TARGET_KERNEL_CONFIG := kangbang_defconfig
#TARGET_KERNEL_SOURCE := kernel/htc/holiday

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := holiday

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# FileSystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 37

# Recovery
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_GRAPHICS:= ../../../device/htc/holiday/recovery/graphics.c
