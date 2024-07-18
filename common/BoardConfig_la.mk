TARGET_NO_KERNEL := true

TARGET_ARCH := loongarch64
TARGET_ARCH_VARIANT := loongarch64
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := loongarch64

# TARGET_DYNAMIC_64_32_MEDIASERVER := true
#PRODUCT_FULL_TREBLE_OVERRIDE := true

## Control binary files for apex, under system/apex or apex
#TARGET_FLATTEN_APEX := true

BOARD_VNDK_VERSION := current
WITH_DEXPREOPT := false

ALLOW_MISSING_DEPENDENCIES := true

TARGET_USERIMAGES_SPARSE_EROFS_DISABLED := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_F2FS_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true


BOARD_BOOTCONFIG += androidboot.force_normal_boot=1
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_BOOTCONFIG += androidboot.selinux=permissive
endif

