## Control Vars
# No Kernel
TARGET_NO_KERNEL := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true

PRODUCT_LOCALES := zh_CN

## Always use Dynamic partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_SYSTEM_PROPERTIES += \
    config.disable_renderscript=1 \

