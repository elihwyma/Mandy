export ARCHS = arm64 arm64e
export TARGET=iphone:clang:13.3:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mandy

Mandy_FILES = Tweak.xm
Mandy_LDFLAGS += -lCSColorPicker
Mandy_CFLAGS = -fobjc-arc
Mandy_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += pref
include $(THEOS_MAKE_PATH)/aggregate.mk
