
BOARD_EXT4_SHARE_DUP_BLOCKS := false

# GSI also includes make_f2fs to support userdata parition in f2fs
# for some devices
TARGET_USERIMAGES_USE_EXT4 := true

# Creates metadata partition mount point under root for
# the devices with metadata parition
BOARD_USES_METADATA_PARTITION := true

# Default is current, but allow devices to override vndk version if needed.
BOARD_VNDK_VERSION := current

# Disable 64 bit mediadrmserver
TARGET_ENABLE_MEDIADRM_64 :=
# TARGET_DYNAMIC_64_32_MEDIASERVER := true

# This flag is set by mainline but isn't desired for GSI.
BOARD_USES_SYSTEM_OTHER_ODEX :=

# Audio: must using XML format for Treblized devices
USE_XML_AUDIO_POLICY_CONF := 1

BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable system property split for Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Include stats logging code in LMKD
TARGET_LMKD_STATS_LOG := true


# Emulator doesn't support sparse image format.
# system.img is always ext4 and non-sparsed.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# GSI also includes make_f2fs to support userdata parition in f2fs
# for some devices
TARGET_USERIMAGES_USE_F2FS := true

# Enable dynamic system image size and reserved 64MB in it.
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 67108864



# GSI forces product and system_ext packages to /system for now.
TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE :=



BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR :=


# GSI specific System Properties
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
TARGET_SYSTEM_EXT_PROP := build/make/target/board/gsi_system_ext.prop
else
TARGET_SYSTEM_EXT_PROP := build/make/target/board/gsi_system_ext_user.prop
endif

# Set this to create /cache mount point for non-A/B devices that mounts /cache.
# The partition size doesn't matter, just to make build pass.
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216

# Setup a vendor image to let PRODUCT_VENDOR_PROPERTIES does not affect GSI
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4


TARGET_ARCH := loongarch64
TARGET_ARCH_VARIANT := loongarch64
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := loongarch64

## Control binary files for apex, under system/apex or apex
#TARGET_FLATTEN_APEX := true

WITH_DEXPREOPT := false

BOARD_BOOTCONFIG += androidboot.force_normal_boot=1
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_BOOTCONFIG += androidboot.selinux=permissive
endif


############# Some Control vars
# Android Verified Boot (AVB)
BOARD_AVB_ENABLE := false



# XC-TODO, not sure these two
#TARGET_USERIMAGES_SPARSE_EROFS_DISABLED := true
#TARGET_USERIMAGES_SPARSE_F2FS_DISABLED := true

