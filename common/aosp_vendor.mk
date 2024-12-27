# Device modules
PRODUCT_PACKAGES += \
    libcodec2_goldfish_vp8dec \
    libcodec2_goldfish_vp9dec \
    libcodec2_goldfish_avcdec \
    local_time.default \

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0-service

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-service.example

# lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.example

# Reboot escrow
PRODUCT_PACKAGES += \
    android.hardware.rebootescrow-service.default

# Extension implementation for Jetpack WindowManager
PRODUCT_PACKAGES += \
    androidx.window.sidecar

PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.1-service.mock

# Enable Incremental on the device via kernel driver
PRODUCT_PROPERTY_OVERRIDES += ro.incremental.enable=yes


PRODUCT_COPY_FILES += \
    device/generic/goldfish/ueventd.ranchu.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    device/generic/goldfish/data/etc/dtb.img:dtb.img \
    device/generic/goldfish/data/etc/apns-conf.xml:data/misc/apns/apns-conf.xml \
    device/generic/goldfish/radio/RadioConfig/radioconfig.xml:data/misc/emulator/config/radioconfig.xml \
    device/generic/goldfish/data/etc/iccprofile_for_sim0.xml:data/misc/modem_simulator/iccprofile_for_sim0.xml \
    device/generic/goldfish/data/etc/numeric_operator.xml:data/misc/modem_simulator/etc/modem_simulator/files/numeric_operator.xml \
    device/generic/goldfish/data/etc/local.prop:data/local.prop \
    device/generic/goldfish/init.system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.system_ext.rc \
    device/generic/goldfish/data/etc/config.ini:config.ini \
    device/generic/goldfish/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
	\
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.autofill.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.autofill.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:${TARGET_COPY_OUT_PRODUCT}/etc/permissions/android.software.verified_boot.xml \
    device/generic/goldfish/data/etc/permissions/privapp-permissions-goldfish.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-goldfish.xml \

