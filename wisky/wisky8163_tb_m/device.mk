
include device/wisky/$(MTK_TARGET_PROJECT)/ProjectConfig.mk


######################################################

# PRODUCT_COPY_FILES overwrite
# Please add flavor project's PRODUCT_COPY_FILES here.
# It will overwrite base project's PRODUCT_COPY_FILES.

PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Thermal
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/thermal.conf:system/etc/.tp/thermal.conf
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/thermal.off.conf:system/etc/.tp/thermal.off.conf
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/ht120.mtc:system/etc/.tp/.ht120.mtc

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/wisky/$(MTK_TARGET_PROJECT)/overlay
DEVICE_PACKAGE_OVERLAYS += device/wisky/$(MTK_BASE_PROJECT)/overlay
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/wifi
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/tablet

# dual input charger support
ifeq ($(strip $(MTK_DUAL_INPUT_CHARGER_SUPPORT)),yes)
  PRODUCT_PROPERTY_OVERRIDES += ro.mtk_diso_support=true
endif

#######################################################

PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/egl.cfg:system/lib/egl/egl.cfg
# PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/ueventd.mt8163.rc:root/ueventd.mt8163.rc

PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/meta_init.project.rc:root/meta_init.project.rc
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/init.recovery.mt8163.rc:root/init.recovery.mt8163.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl \
                      device/wisky/wisky8163_tb_m/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm
endif

# Add FlashTool needed files
#PRODUCT_COPY_FILES += device/wisky/$(MTK_TARGET_PROJECT)/EBR1:EBR1
#ifneq ($(wildcard device/wisky/$(MTK_TARGET_PROJECT)/EBR2),)
#  PRODUCT_COPY_FILES += device/wisky/$(MTK_TARGET_PROJECT)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += device/wisky/$(MTK_TARGET_PROJECT)/MBR:MBR
#PRODUCT_COPY_FILES += device/wisky/$(MTK_TARGET_PROJECT)/MT8163_Android_scatter.txt:MT8163_Android_scatter.txt




### copy it in common/device.mk
# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk
# PRODUCT_COPY_FILES += vendor/mediatek/proprietary/frameworks/opt/GeoCoding/geocoding.db:system/etc/geocoding.db

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/hardware/connectivity/gps/HAL/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:system/lib/open_nfc_driver.ko

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

### copy it in common/device.mk
# alps/mediatek/external/sip/
#ifeq ($(MTK_SIP_SUPPORT),yes)
#  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
#  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
#else
#  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
#  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
#endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=128m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=256m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT8163

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0
PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=ss

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8163_tb_m/factory/res/sound/testpattern1.wav:system/res/sound/testpattern1.wav
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8163_tb_m/factory/res/sound/ringtone.wav:system/res/sound/ringtone.wav

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt8163/ACCDET.kl:system/usr/keylayout/ACCDET.kl
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/audio_policy.conf:system/etc/audio_policy.conf

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8163_tb_m/factory/res/images/lcd_test_00.png:system/res/images/lcd_test_00.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8163_tb_m/factory/res/images/lcd_test_01.png:system/res/images/lcd_test_01.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8163_tb_m/factory/res/images/lcd_test_02.png:system/res/images/lcd_test_02.png


# USB
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/init.mt8163.usb.rc:root/init.mt8163.usb.rc

# Thermal
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/thermal.conf:system/etc/.tp/thermal.conf
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/thermal.off.conf:system/etc/.tp/thermal.off.conf
PRODUCT_COPY_FILES += device/wisky/wisky8163_tb_m/ht120.mtc:system/etc/.tp/.ht120.mtc

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/wisky/wisky8163_tb_m/overlay
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/tablet
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif


ifeq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    PRODUCT_PACKAGES += DangerDash
endif

# dual input charger support
ifeq ($(strip $(MTK_DUAL_INPUT_CHARGER_SUPPORT)),yes)
  PRODUCT_PROPERTY_OVERRIDES += ro.mtk_diso_support=true
endif

# BT
PRODUCT_PACKAGES += \
    libbluetooth_mtk \
    libbluetooth_mtk_pure \
    libbluetooth_hw_test \
    autobt
PRODUCT_PACKAGES += PGA_50_Free_Games
# inherit 8163 platform
$(call inherit-product, device/mediatek/mt8163/device.mk)

$(call inherit-product-if-exists, vendor/wisky/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)

# $(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
