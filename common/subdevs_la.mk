## XC: include all subdevs

include device/loongson/loongsonboard/subdevs/boot/boot.mk
include device/loongson/loongsonboard/subdevs/security/security.mk
include device/loongson/loongsonboard/subdevs/performance/performance.mk
include device/loongson/loongsonboard/subdevs/graphics/graphics.mk
include device/loongson/loongsonboard/subdevs/audio/audio.mk
include device/loongson/loongsonboard/subdevs/network/network.mk


# FIXME API_LEVEL 32 required manifest fcm verison ge 6
# but now is 3
PRODUCT_SHIPPING_API_LEVEL := 31

DEVICE_MANIFEST_FILE += \
    device/loongson/loongsonboard/manifest.xml

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Enable userspace reboot
#$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
#$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

