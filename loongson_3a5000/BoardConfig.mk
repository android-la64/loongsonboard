#
# Copyright (C) 2019 The Android Open Source Project
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

include device/loongson/loongsonboard/common/BoardConfig_la.mk

TARGET_BOARD_PLATFORM := loongson
BOARD_BOOTCONFIG += androidboot.hardware=loongson_3a5000
#--------

HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

# no hardware camera
USE_CAMERA_STUB := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Build OpenGLES emulation guest and host libraries
BUILD_EMULATOR_OPENGL := true

# Build and enable the OpenGL ES View renderer. When running on the emulator,
# the GLES renderer disables itself if host GL acceleration isn't available.
USE_OPENGL_RENDERER := true

# DYNAMIC_PARTITIONS, but do NOT use A/B device
# Non-A/B device
AB_OTA_UPDATER := false

# Build super.img default
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_SIZE := 4303355904 # 4G + 8M
BOARD_SUPER_PARTITION_GROUPS := la_dynamic_partitions
# Here, LA comes from 'BOARD_SUPER_PARTITION_GROUPS'  
BOARD_LA_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_LA_DYNAMIC_PARTITIONS_SIZE := 4294967296 # 4G

#!!!
# GSI forces product and system_ext packages to /system for now.
TARGET_COPY_OUT_PRODUCT := system/product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE :=
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE :=

#ELSE
#TARGET_COPY_OUT_PRODUCT := product
#BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_SYSTEM_EXT := system_ext
#BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_AVB_ENABLE := false



#BOARD_SUPER_PARTITION_METADATA_DEVICE := super
#BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true


# When set dynamic_partitions, do not need this
#BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648 # 2G

TARGET_COPY_OUT_VENDOR := vendor
# PRODUCT_USE_DYNAMIC_PARTITIONS = true, do not need set size
#BOARD_VENDORIMAGE_PARTITION_SIZE   := 268435456 # 256M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# This may cause build error
#BOARD_BOOT_HEADER_VERSION := 4
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

#vendor boot
BOARD_INCLUDE_DTB_IN_BOOTIMG := false
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_RAMDISK_USE_LZ4 := true

# Enable chain partition for system.
BOARD_AVB_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_FLASH_BLOCK_SIZE := 512

BOARD_SEPOLICY_DIRS := \
    device/loongson/loongsonboard/common/sepolicy

#DEVICE_MATRIX_FILE   := device/generic/goldfish/compatibility_matrix.xml

# Creates metadata partition mount point under root for
# the devices with metadata parition
BOARD_USES_METADATA_PARTITION := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648  # 2G
TARGET_USERIMAGES_USE_F2FS := true
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

DEVICE_MANIFEST_FILE := device/loongson/loongsonboard/loongson_3a5000/manifest.xml
#DEVICE_MANIFEST_FILE += device/generic/goldfish/manifest.camera.xml
