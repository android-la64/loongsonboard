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

# Disable Scudo outside of eng builds to save RAM.
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_DISABLE_SCUDO := true
endif

##########################################
#  common system from $SRC_TARGET_DIR
#########################################
# common control vars for all LA arch
$(call inherit-product, device/loongson/loongsonboard/common/common_la.mk)

### All products are controlled by these config files
# mini_system
$(call inherit-product, device/loongson/loongsonboard/common/mini_system.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# All packages in this file are include in 'aosp_product.mk' alreay
$(call inherit-product, device/loongson/loongsonboard/common/mini_product.mk)


##########################################
#  Settings for LA and LA3A50000
#########################################
# Patch for system(XC): some features not ready now! eg, JIT for ART.
$(call inherit-product, device/loongson/loongsonboard/common/system_patch_la.mk)

# prop for LA35000 ONLY
$(call inherit-product, device/loongson/loongsonboard/loongson_3a5000/la3a5000.prop)


##########################################
#  All subdevs (graphics, audio, net etc)
#########################################
PRODUCT_SOONG_NAMESPACES += \
    device/generic/goldfish \
    external/drm_hwcomposer

# system_ext: optional[wwd]
$(call inherit-product-if-exist, device/loongson/loongsonboard/common/system_ext_la.mk)

# Enable Scoped Storage related
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Extra packages
$(call inherit-product, device/loongson/loongsonboard/common/subdevs_la.mk)

## Vendor part
$(call inherit-product, device/loongson/loongsonboard/common/aosp_vendor.mk)

# la35000 special seetings
$(call inherit-product, device/loongson/loongsonboard/loongson_3a5000/device_la_3a5000.mk)


# setup dalvik vm configs
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

##########################################
#  PRODUCT INFO
#########################################
## Latest to overwrite all above settings under build/make/target == $(SRC_TARGET_DIR)
PRODUCT_NAME := loongson_3a5000
PRODUCT_DEVICE := loongson_3a5000
PRODUCT_BRAND := Loongson
PRODUCT_MANUFACTURER := Loongson
PRODUCT_MODEL := Android on LoongsonArch64

#PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet

