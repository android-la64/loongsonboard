# Graphics HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-impl \
    android.hardware.graphics.allocator@4.0-service \
    android.hardware.graphics.allocator@4.0-service.minigbm \
    android.hardware.graphics.composer@2.4-impl \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.mapper@4.0-impl.minigbm \
    android.hardware.configstore@1.1-service \

# graphics hal
PRODUCT_PACKAGES += \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi \
    vndservicemanager \
    vndservice

	#memtrack \

PRODUCT_PACKAGES += \
    hwcomposer.drm hwcomposer.drm_minigbm hwcomposer.drm_celadon hwcomposer.drm_minigbm_celadon \
    hwcomposer.drm_gbm_cros hwcomposer.drm_gbm_cros_celadon \
    gralloc.minigbm_dmabuf gralloc.minigbm gralloc.minigbm_arcvm gralloc.minigbm_gbm_mesa \
    gralloc.gbm gralloc.gbm_hack gralloc.gbm_noscanout \
    libGLES_mesa libglapi libgallium_dri amdgpu.ids
