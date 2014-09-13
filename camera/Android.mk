LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(BOARD_CAMERA_HAVE_ISO),true)
    LOCAL_CFLAGS += -DHAVE_ISO
endif

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils libcutils

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.qcom

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# It's either this, or pointing to workaround/ for src,res and the manifest
# LOCAL_FULL_MANIFEST_FILE := $(LOCAL_PATH)/workaround/$(LOCAL_MANIFEST_FILE)
# LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/workaround/res
# LOCAL_SRC_FILES := $(call all-java-files-under, src/workaround)
LOCAL_PATH := $(LOCAL_PATH)/workaround

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := CameraWorkaround

include $(BUILD_PACKAGE)
