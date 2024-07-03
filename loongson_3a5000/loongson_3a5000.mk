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

## XC-TODO
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
ALLOW_MISSING_DEPENDENCIES := true
#TARGET_SUPPORTS_OMX_SERVICE := false
#PRODUCT_USES_DEFAULT_ART_CONFIG := false
## If we have such files
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST +=

# This file set some 64b only properity
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable CSI checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)


#
# All components inherited here go to vendor image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

PRODUCT_SYSTEM_PROPERTIES += \
    config.disable_renderscript=1 \
    ro.telephony.default_network=9

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.usejit=false \
    ro.hw_timeout_multiplier=8 \
    debug.drm.mode.force=640x480 \
    gralloc.drm.kms=/dev/dri/card0 \
    ro.opengles.version=131072 \
    ro.hardware.egl=mesa

# application packages
PRODUCT_PACKAGES += \
    Calendar \
    DeskClock \
    LatinIME \
    Music \
    OneTimeInitializer \
    preinstalled-packages-platform-handheld-product.xml \
    SettingsIntelligence \

#########   Default AOSP sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)

# Additional settings used in all AOSP builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone?=Ring_Synth_04.ogg \
    ro.config.notification_sound?=pixiedust.ogg \
    ro.com.android.dataroaming?=true \

# Telephony:
#   Provide a APN configuration to GSI product
# XC-TODO
PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

## XC-TODO: aosp_vendor.mk?

############################# All HALs  ##############################

# hardware/interfaces
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl \
    \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.service \
    \
    android.hardware.graphics.allocator@4.0-impl \
    android.hardware.graphics.allocator@4.0-service \
    android.hardware.graphics.composer@2.4-impl \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl \
    android.hardware.configstore@1.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    \
    android.hardware.keymaster@4.0-impl \
    android.hardware.keymaster@4.0-service \
    android.hardware.gatekeeper@1.0-service.software \
    android.hardware.gatekeeper@1.0-impl \
    \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health.storage@1.0-service \
    android.hardware.power-service.example \
    \
    android.hardware.wifi@1.0-service \

# graphics hal
PRODUCT_PACKAGES += \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi \
    vndservicemanager \
    vndservice


# system packages
PRODUCT_PACKAGES += \
    audio.primary \
    audio.usb.default

    #memtrack \

# system configurations
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/init.loongson_3a5000.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.rc \
    $(LOCAL_PATH)/init.loongson_3a5000.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.usb.rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    $(LOCAL_PATH)/fstab.loongson_3a5000:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/fstab.loongson_3a5000.initrd:$(TARGET_COPY_OUT_RAMDISK)/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/../common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/../common/displayconfig/default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/default.xml \
    $(PRODUCT_COPY_FILES)

    #$(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \

# media configurations
# PRODUCT_COPY_FILES := \
#     frameworks/av/media/libeffects/data/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
#     frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
#     frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
#     frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
#     frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
#     frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
#     frameworks/base/data/sounds/effects/ogg/Effect_Tick_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
#     frameworks/base/data/sounds/effects/ogg/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \
#     $(PRODUCT_COPY_FILES)

    # XC-TODO
    #$(LOCAL_PATH)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    #device/generic/goldfish/camera/media/profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    #device/generic/goldfish/camera/media/codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \

#### 
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet
