#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/twrp/config/common_full_phone.mk)

# Inherit from generic device
$(call inherit-product, device/xiaomi/malachite/device.mk)

PRODUCT_DEVICE := malachite
PRODUCT_NAME := twrp_malachite
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Redmi Note 14 Pro 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="missi_phone_global_only64-user 14 UP1A.231005.007 V816.0.7.0.UOOMIXM release-keys"

BUILD_FINGERPRINT := Android/missi_phone_global/missi:14/UP1A.231005.007/V816.0.7.0.UOOMIXM:user/release-keys
