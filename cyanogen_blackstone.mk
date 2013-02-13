# Inherit AOSP device configuration for blackstone.
$(call inherit-product, device/htc/blackstone/full_blackstone.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#

PRODUCT_NAME := blackstone
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := blackstone
PRODUCT_MODEL := HTC Touch HD
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRI40 BUILD_FINGERPRINT=google/passion/passion:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

# Extra blackstone overlay
PRODUCT_PACKAGE_OVERLAYS += device/htc/blackstone/overlay

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=0 \

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := blackstone
PRODUCT_VERSION_DEVICE_SPECIFIC := blackstone
-include vendor/cyanogen/products/common_versions.mk

#
# Copy blackstone specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
