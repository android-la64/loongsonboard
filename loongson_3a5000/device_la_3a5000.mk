PRODUCT_SHIPPING_API_LEVEL := 35
PRODUCT_FULL_TREBLE_OVERRIDE := true

DEVICE_MANIFEST_FILE += \
    device/loongson/loongsonboard/manifest.xml

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Enable userspace reboot
#$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

PRODUCT_BUILD_VENDOR_IMAGE := true
PRODUCT_BUILD_USERDATA_IMAGE := true
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_BUILD_CACHE_IMAGE := true
#PRODUCT_BUILD_VBMETA_IMAGE := true

PRODUCT_PACKAGES += \
    hwservicemanager \
    android.hidl.allocator@1.0-service

############################# All HALs  ##############################
# system configurations
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/fstab.loongson_3a5000:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/fstab.loongson_3a5000.ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/init.loongson_3a5000.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.rc \
    $(LOCAL_PATH)/../common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/../common/displayconfig/default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/default.xml \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
	$(LOCAL_PATH)/la_net.rc:$(TARGET_COPY_OUT_VENDOR)/etc/la_net.rc \
	$(LOCAL_PATH)/la_net.sh:$(TARGET_COPY_OUT_VENDOR)/bin/la_net.sh \
    $(PRODUCT_COPY_FILES)



