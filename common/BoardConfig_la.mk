# No Kernel
TARGET_NO_KERNEL := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true

# This flag is set by mainline but isn't desired for GSI.
BOARD_USES_SYSTEM_OTHER_ODEX :=

TARGET_ARCH := loongarch64
TARGET_ARCH_VARIANT := loongarch64
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := loongarch64

# Disable 64 bit mediadrmserver
TARGET_ENABLE_MEDIADRM_64 :=
# TARGET_DYNAMIC_64_32_MEDIASERVER := true

## Control binary files for apex, under system/apex or apex
#TARGET_FLATTEN_APEX := true

BOARD_VNDK_VERSION := current
WITH_DEXPREOPT := false

BOARD_BOOTCONFIG += androidboot.force_normal_boot=1
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_BOOTCONFIG += androidboot.selinux=permissive
endif

############# Some Control vars
# system.img is always ext4 and non-sparsed.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# GSI also includes make_f2fs to support userdata parition in f2fs
# for some devices
TARGET_USERIMAGES_USE_EXT4 := true
# XC-TODO, not sure these two
TARGET_USERIMAGES_SPARSE_EROFS_DISABLED := true
TARGET_USERIMAGES_SPARSE_F2FS_DISABLED := true


# Android Verified Boot (AVB)
BOARD_AVB_ENABLE := false

# Set this to create /cache mount point for non-A/B devices that mounts /cache.
# The partition size doesn't matter, just to make build pass.
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216

# Audio: must using XML format for Treblized devices
USE_XML_AUDIO_POLICY_CONF := 1

#BOARD_FLASH_BLOCK_SIZE := 4096

# GSI specific System Properties
TARGET_SYSTEM_EXT_PROP := build/make/target/board/gsi_system_ext.prop

# Enable system property split for Treble
#BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
