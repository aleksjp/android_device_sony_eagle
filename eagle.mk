# Include non-opensource parts
$(call inherit-product-if-exists, vendor/sony/eagle/eagle-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

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
     $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
     $(COMMON_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
     $(COMMON_PATH)/recovery/recovery.fstab:recovery/root/etc/fstab.qcom \
     $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
     $(COMMON_PATH)/rootdir/init.sony.rc:root/init.sony.rc         

# Sbin
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/charger:root/charger \
    $(COMMON_PATH)/rootdir/sbin/wait4tad_static:root/sbin/wait4tad_static \
    $(COMMON_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl
    
PRODUCT_COPY_FILES += \
     device/sony/eagle/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
     $(COMMON_PATH)/rootdir/system/etc/extra.fstab:recovery/root/etc/extra.fstab \
     $(COMMON_PATH)/rootdir/system/etc/sysmon.cfg:system/etc/sysmon.cfg \
     $(COMMON_PATH)/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf
     

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240     

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
    
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    persist.fuse_sdcard=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.cwm.enable_key_repeat=true \
    ro.qualcomm.bt.hci_transport=smd \
    ro.qualcomm.cabl=0    
    
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1 \
    ro.adb.secure=0 \
    ro.debuggable=1 
    
PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish \
    root/ueventd.goldfish.rc \
    recovery/root/ueventd.goldfish.rc
              
$(call inherit-product, build/target/product/full.mk)
