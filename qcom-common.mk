# Copyright (C) 2013 The CyanogenMod Project
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

COMMON_PATH := device/sony/qcom-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Camera wrapper
PRODUCT_PACKAGES += \
    camera.qcom

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.qcom

# Lights
PRODUCT_PACKAGES += \
    lights.qcom

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Qualcomm random numbers generated
PRODUCT_PACKAGES += qrngd

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

ifeq ($(BOARD_WLAN_DEVICE),qcwcn)
PRODUCT_PROPERTY_OVERRIDES += \
    wlan.driver.ath=0

# Hostapd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# SoftAP
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libqsap_sdk
endif

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

ifneq ($(USE_ADRENO_42),true)
ifneq ($(USE_ADRENO_330),true)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Include non-opensource parts
$(call inherit-product, vendor/sony/qcom-common/qcom-common-vendor.mk)
endif
endif
