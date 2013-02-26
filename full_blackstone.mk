#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/htc/blackstone/overlay

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_PACKAGES += \
    Launcher2 \
    VoiceDialer

# Libraries
PRODUCT_PACKAGES += \
    wlan_loader \
    tiwlan.ini \
    libOmxCore \
#    libstagefrighthw
    libhtc_acoustic

# Drivers
PRODUCT_PACKAGES += \
    copybit.msm7k \
    gralloc.blackstone \
    lights.blackstone \
    sensors.blackstone \
    gps.blackstone \
    libhtcgeneric-ril \
    libcamera \
    librs_jni \
    microp-keypad.kcm \
    vold.fstab

PRODUCT_COPY_FILES ?= 

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \

# Prebuilt stuff
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/files/init.blackstone.rc:root/init.blackstone.rc \
    device/htc/blackstone/configs/files/libnl.so:system/lib/libnl.so \
    device/htc/blackstone/configs/files/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    device/htc/blackstone/configs/files/ueventd.blackstone.rc:root/ueventd.blackstone.rc \
    device/htc/blackstone/configs/files/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \
    device/htc/blackstone/configs/files/liboemcamera.so.dream:system/lib/liboemcamera.so \
    device/htc/blackstone/configs/files/pppd_runner:system/bin/pppd_runner \
    device/htc/blackstone/configs/files/wifi.sh:system/bin/wifi.sh \
    device/htc/blackstone/configs/files/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf \
    device/htc/blackstone/configs/files/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/blackstone/configs/files/ts-calibration:system/etc/ts-calibration \
    device/htc/blackstone/configs/files/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \
    device/htc/blackstone/configs/files/wpa_supplicant:system/bin/wpa_supplicant \
    device/htc/blackstone/configs/files/wpa_cli:system/bin/wpa_cli
#    device/htc/blackstone/configs/files/wlan_loader:system/bin/wlan_loader


# Some init scripts
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/files/00nandfixes:/system/etc/init.d/00nandfixes \

# ppp scripts
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/files/ip-up-gprs:/system/etc/ppp/ip-up-gprs \
    device/htc/blackstone/configs/files/ip-down-gprs:/system/etc/ppp/ip-down-gprs

# Media codecs
PRODUCT_COPY_FILES += \
	device/htc/blackstone/configs/files/libOmxH264Dec.so:/system/lib/libOmxH264Dec.so \
	device/htc/blackstone/configs/files/libOmxMpeg4Dec.so:/system/lib/libOmxMpeg4Dec.so \
	device/htc/blackstone/configs/files/libOmxVidEnc.so:system/lib/libOmxVidEnc.so 

# Firmware
PRODUCT_COPY_FILES += \
	device/htc/blackstone/configs/files/brf6350.bin:/system/etc/firmware/brf6350.bin \
	device/htc/blackstone/configs/files/bcm4325.hcd:/system/etc/firmware/bcm4325.hcd \
	device/htc/blackstone/configs/files/BCM4325_apsta.bin:/system/etc/firmware/BCM4325_apsta.bin \
	device/htc/blackstone/configs/files/brf6300.bin:/system/etc/firmware/brf6300.bin \
#        device/htc/blackstone/configs/files/tiwlan.ini:/system/etc/wifi/tiwlan.ini
	device/htc/blackstone/configs/files/Fw1251r1c.bin:/system/etc/wifi/Fw1251r1c.bin

# Vold config
PRODUCT_COPY_FILES += \
	device/htc/blackstone/configs/files/vold.fstab:system/etc/vold.fstab

# Keylayout / Headset
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/keylayout/microp-keypad.kl:system/usr/keylayout/microp-keypad.kl \
    device/htc/blackstone/configs/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/blackstone/configs/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/blackstone/configs/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/blackstone/configs/keylayout/raph_navi_pad.kl:system/usr/keylayout/raph_navi_pad.kl

# Acoustic (Sound processor) settings
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/acoustic/AudioFilterTable.csv:system/etc/AudioFilterTable.csv \
    device/htc/blackstone/configs/acoustic/AudioPara3.csv:system/etc/AudioPara3.csv \
    device/htc/blackstone/configs/acoustic/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    device/htc/blackstone/configs/acoustic/AudioPreProcessTable.csv:system/etc/AudioPreProcessTable.csv \
    device/htc/blackstone/configs/acoustic/AudioPara4.csv:system/etc/AudioPara4.csv 


PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=2 \
    ro.ril.hsupa.category=12 \
    ro.ril.enable.a52=1 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=2 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtcgeneric-ril.so \
    wifi.interface=tiwlan0 \
    persist.sys.scrollingcache=2 \
    persist.sys.use_dithering=0 \
    persist.sys.purgeable_assets=1 \
    windowsmgr.max_events_per_sec=150 \
    settings.display.autobacklight=0 

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=120

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density = 240
    qemu.sf.lcd_density=240

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# Disable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:fast

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65537

# Increase default VM heap size to prevent certain apps from crashing
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/blackstone/configs/files/media_profiles.xml:/system/etc/media_profiles.xml

# Kernel stuff
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/blackstone/prebuilt_kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel
	
PRODUCT_MANUFACTURER := HTC

## (2) Also get non-open-source aspects if available
$(call inherit-product-if-exists, vendor/htc/blackstone/blackstone-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
