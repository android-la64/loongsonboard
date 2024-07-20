# Product packages: we can added more later
PRODUCT_PACKAGES += \
    Calendar \
    DeskClock \
    LatinIME \
    Music \
    OneTimeInitializer \
    preinstalled-packages-platform-handheld-product.xml \
    SettingsIntelligence \

#    frameworks-base-overlays
# More AOSP packages
#PRODUCT_PACKAGES += \
#    PhotoTable \
#    preinstalled-packages-platform-aosp-product.xml \
#    WallpaperPicker 
#    unpackage-apps \

#$(call inherit-product, $(SRC_TARGET_DIR)/product/media_product.mk)

#PRODUCT_PACKAGES_DEBUG += \
#    frameworks-base-overlays-debug



# Default AOSP sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)

# Additional settings used in all AOSP builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone?=Ring_Synth_04.ogg \
    ro.config.notification_sound?=pixiedust.ogg \
    ro.com.android.dataroaming?=true \

# Telephony:
#   Provide a APN configuration to GSI product
PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

