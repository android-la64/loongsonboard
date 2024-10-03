PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \

	#$(LOCAL_PATH)/init.loongson_3a5000.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.loongson_3a5000.usb.rc \
	#$(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \

