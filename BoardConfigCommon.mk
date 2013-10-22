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

# QCOM hardware
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true

# Use the CM PowerHAL
TARGET_USES_CM_POWERHAL := true
CM_POWERHAL_EXTENSION := qcom

# Lights HAL
TARGET_PROVIDES_LIBLIGHT := true

# Graphics
ifeq ($(TARGET_QCOM_DISPLAY_VARIANT),)
TARGET_QCOM_DISPLAY_VARIANT := caf
endif
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

ifeq ($(BOARD_EGL_CFG),)
BOARD_EGL_CFG := device/sony/qcom-common/rootdir/system/lib/egl/egl.cfg
endif

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_NO_CELLINFOLIST := true
BOARD_USES_QCOM_RIL_RESPONSE_5_ELEMENTS := true

# Audio
ifeq ($(TARGET_QCOM_AUDIO_VARIANT),)
TARGET_QCOM_AUDIO_VARIANT := caf
endif
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Media
ifeq ($(TARGET_QCOM_MEDIA_VARIANT),)
TARGET_QCOM_MEDIA_VARIANT := caf
endif

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Bluetoth
BOARD_HAVE_BLUETOOTH := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

BOARD_SEPOLICY_DIRS += \
    device/sony/qcom-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    property.te \
    qmux.te \
    rild.te \
    rmt.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    wpa_supplicant.te
