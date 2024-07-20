# XC: This file include some features NOT ready for LA arch
#  For example jit in ART etc

# Workaround for AOSP mainline
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

PRODUCT_PACKAGES += 
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \

PRODUCT_SYSTEM_PROPERTIES += \
    config.disable_renderscript=1 \


TARGET_SUPPORTS_OMX_SERVICE := false
PRODUCT_USES_DEFAULT_ART_CONFIG := false

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.usejit = false

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    #root/init.zygote64.rc

