
#$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

############################# All HALs  ##############################
# system configurations
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/init.loongson_3a5000.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.rc \
    $(LOCAL_PATH)/init.loongson_3a5000.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.usb.rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    $(LOCAL_PATH)/fstab.loongson_3a5000:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.loongson_3a5000 \
    $(LOCAL_PATH)/fstab.loongson_3a5000.ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.loongson_3a5000 \
	$(LOCAL_PATH)/la_net.rc:$(TARGET_COPY_OUT_VENDOR)/etc/la_net.rc \
	$(LOCAL_PATH)/la_net.sh:$(TARGET_COPY_OUT_VENDOR)/bin/la_net.sh \
    $(LOCAL_PATH)/../common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/../common/displayconfig/default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/default.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    $(PRODUCT_COPY_FILES)


	#$(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \

