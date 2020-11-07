export ARCHS = arm64 arm64e
export TARGET=iphone:clang:13.3:13.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Mandy

SOURCES = $(shell find . -name '*.m')
Mandy_FILES = ${SOURCES}

Mandy_FRAMEWORKS = UIKit Foundation
Mandy_PRIVATE_FRAMEWORKS = Preferences
Mandy_INSTALL_PATH = /Library/PreferenceBundles
Mandy_CFLAGS = -fobjc-arc
Mandy_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/bundle.mk
