# Include non-opensource parts
$(call inherit-product-if-exists, vendor/eagle/eagle-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/eagle/overlay

COMMON_PATH := device/sony/eagle
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
# Device specific init
PRODUCT_COPY_FILES += \
     $(COMMON_PATH)/recovery/recovery.fstab:recovery/root/etc/fstab.qcom \
     $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
     $(COMMON_PATH)/recovery/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc \
        

# Sbin
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/charger:root/charger \
    $(COMMON_PATH)/rootdir/sbin/wait4tad_static:root/sbin/wait4tad_static \
    $(COMMON_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240     

PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish \
    root/ueventd.goldfish.rc \
    recovery/root/ueventd.goldfish.rc
              
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_eagle
PRODUCT_DEVICE := eagle
