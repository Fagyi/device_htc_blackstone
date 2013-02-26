# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# Camera
# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
JS_ENGINE := v8

# inherit from the proprietary version
-include vendor/htc/blackstone/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6j
TARGET_BOARD_PLATFORM_GPU := qcom

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Audio
TARGET_PROVIDES_LIBAUDIO := hardware/msm7k/libaudio_wince
BUILD_LIB_HTC_ACOUSTIC_WINCE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libWifiApi
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_DRIVER_FW_AP_PATH      := "/etc/firmware/BCM4325_apsta.bin"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_HAVE_BLUETOOTH := true

BOARD_VENDOR_USE_AKMD := true
USE_PV_WINDOWS_MEDIA := false	
BUILD_WITH_FULL_STAGEFRIGHT := true

# Remove when we have camera support.
USE_CAMERA_STUB := false

# Our hardware is not OpenGLES-2 capable
BOARD_NO_GL2 := true	
BOARD_GL_TEX_POW2_DIMENSION_REQUIRED := true
#BOARD_HAS_LIMITED_EGL := true

# Enable legacy graphics code in surfaceflinger, for performance improvement
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true

# Kernel options
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := gsensor_axis=-2,-1,3 msmvkeyb_toggle=off panic=0 pm.sleep_mode=1 no_console_suspend=1 msm_blackstone_pad.vibrate=1
TARGET_PREBUILT_KERNEL := device/htc/blackstone/prebuilt_kernel/kernel
LOCAL_KERNEL := device/htc/blackstone/prebuilt_kernel/kernel

# GPS
BOARD_GPS_LIBRARIES := libgps
BOARD_VENDOR_XDANDROID_GPS_HARDWARE := blackstone
BOARD_GPS_LIBRARIES := gps.blackstone

# Ota updates
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_BOOTLOADER_BOARD_NAME := blackstone
TARGET_OTA_ASSERT_DEVICE := blackstone
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=blackstone

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/blackstone/configs/files/egl.cfg

# Prelink settings
PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=\$(TOP)/vendor/cyanogen/prelink-linux-arm-hero.map


# cat /proc/mtd      Corrected for HTC TOUCH HD aka Blackstone, but building problem with it.
# dev:    size   erasesize  name
# mtd0: 005c0000 00020000 "recovery"
# mtd1: 00100000 00020000 "misc"
# mtd2: 00400000 00020000 "boot"
# mtd3: 0c000000 00020000 "system"
# mtd4: 0e4e0000 00020000 "userdata"
# mtd5: 01060000 00020000 "cache"
