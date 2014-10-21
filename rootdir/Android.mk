LOCAL_PATH:= $(call my-dir)

ifneq ($(filter msm8960,$(TARGET_BOARD_PLATFORM)),)
include $(CLEAR_VARS)
LOCAL_MODULE       := media_codecs.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES    := system/etc/media_codecs_8960.xml
include $(BUILD_PREBUILT)

else

include $(CLEAR_VARS)
LOCAL_MODULE       := media_codecs.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES    := system/etc/media_codecs.xml
include $(BUILD_PREBUILT)
endif
