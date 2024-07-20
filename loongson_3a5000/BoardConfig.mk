#
# Copyright 2020 Android-RPi Project
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

# DYNAMIC_PARTITIONS, but do NOT use A/B device
# Non-A/B device
AB_OTA_UPDATER := false

# Build super.img defualt
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_SIZE := 4303355904 # 4G + 8M
BOARD_SUPER_PARTITION_GROUPS := la_dynamic_partitions
# Here, LA comes from 'BOARD_SUPER_PARTITION_GROUPS'  
BOARD_LA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_LA_DYNAMIC_PARTITIONS_SIZE := 4294967296 # 4G

TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

#BOARD_SUPER_PARTITION_METADATA_DEVICE := super
#BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true

#!!!
# GSI forces product and system_ext packages to /system for now.
#TARGET_COPY_OUT_PRODUCT := system/product
#TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext


# When set dynamic_partitions, do not need this
#BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648 # 2G

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE   := 268435456 # 256M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Creates metadata partition mount point under root for
# the devices with metadata parition
BOARD_USES_METADATA_PARTITION := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912  # 512M
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs


## XC-TODO: use SW-Rendering
BOARD_MESA3D_USES_MESON_BUILD := true
BOARD_MESA3D_GALLIUM_DRIVERS := swrast
BOARD_MESA3D_FORCE_SOFTPIPE := true
USE_OPENGL_RENDERER := true
TARGET_USES_HWC2 := true
TARGET_SCREEN_DENSITY := 160

BOARD_SEPOLICY_DIRS := \
    device/loongson/loongsonboard/common/sepolicy

DEVICE_MANIFEST_FILE := device/loongson/loongsonboard/loongson_3a5000/manifest.xml

