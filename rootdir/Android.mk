LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := media_codecs.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)
ifneq ($(filter msm8960,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES    := system/etc/media_codecs_8960.xml
else
LOCAL_SRC_FILES    := system/etc/media_codecs.xml
endif
include $(BUILD_PREBUILT)
