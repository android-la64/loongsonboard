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

PRODUCT_NAME := loongson_3a5000
PRODUCT_DEVICE := loongson_3a5000
PRODUCT_BRAND := Loongson
PRODUCT_MANUFACTURER := Loongson
PRODUCT_MODEL := Android on LoongsonArch64

LOCAL_64ONLY := _64

# Disable Scudo outside of eng builds to save RAM.
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_DISABLE_SCUDO := true
endif


$(call inherit-product, device/loongson/loongsonboard/common/common_la.mk)
# Patch for system(XC): some features not ready now!
$(call inherit-product, device/loongson/loongsonboard/common/system_patch_la.mk)
$(call inherit-product, device/loongson/loongsonboard/loongson_3a5000/la3a5000.prop)


### All products are controlled by these config files
# mini_system
$(call inherit-product, device/loongson/loongsonboard/common/mini_system.mk)

$(call inherit-product, device/loongson/loongsonboard/common/mini_product.mk)

# system_ext: optional[wwd]
$(call inherit-product-if-exist, device/loongson/loongsonboard/common/system_ext_la.mk)

# Extra packages
$(call inherit-product, device/loongson/loongsonboard/common/subdevs_la.mk)

## Vendor part
# AOSP default vendor configs
$(call inherit-product, device/loongson/loongsonboard/common/aosp_vendor.mk)

# k1 special vendor packages
$(call inherit-product, device/loongson/loongsonboard/loongson_3a5000/device_la_3a5000.mk)

# setup dalvik vm configs
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet

