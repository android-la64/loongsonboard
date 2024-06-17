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

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := true

TARGET_ARCH := loongarch64
TARGET_ARCH_VARIANT := loongarch64
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := loongarch64

TARGET_DYNAMIC_64_32_MEDIASERVER := true

TARGET_FLATTEN_APEX := true

PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

ALLOW_MISSING_DEPENDENCIES := true
WITH_DEXPREOPT := false

TARGET_BOARD_PLATFORM := loongson

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648 # 2G
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912  # 512M

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE   := 268435456 # 256M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_FLASH_BLOCK_SIZE := 4096

USE_XML_AUDIO_POLICY_CONF := 1

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
