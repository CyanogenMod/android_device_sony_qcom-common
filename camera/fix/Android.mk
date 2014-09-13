ifeq ($(TARGET_BOARD_PLATFORM),msm8974)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := CameraFix

include $(BUILD_PACKAGE)

endif
