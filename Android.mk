LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),sony)
ifeq ($(call is-board-platform-in-list,msm8974 msm8960 msm8660 msm8226),true)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
endif
