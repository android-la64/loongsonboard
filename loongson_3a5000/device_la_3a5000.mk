# FIXME API_LEVEL 32 required manifest fcm verison ge 6
# but now is 3
#PRODUCT_SHIPPING_API_LEVEL := 31

DEVICE_MANIFEST_FILE += \
    device/loongson/loongsonboard/manifest.xml

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Enable userspace reboot
#$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

PRODUCT_BUILD_VENDOR_IMAGE := true
PRODUCT_BUILD_USERDATA_IMAGE := true

############################# All HALs  ##############################
# system configurations
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/fstab.loongson_3a5000:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/fstab.loongson_3a5000.ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/init.loongson_3a5000.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.rc \
    $(LOCAL_PATH)/../common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/../common/displayconfig/default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/default.xml \
    $(PRODUCT_COPY_FILES)


    #$(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
	#$(LOCAL_PATH)/la_net.rc:$(TARGET_COPY_OUT_VENDOR)/etc/la_net.rc \
	#$(LOCAL_PATH)/la_net.sh:$(TARGET_COPY_OUT_VENDOR)/bin/la_net.sh \

