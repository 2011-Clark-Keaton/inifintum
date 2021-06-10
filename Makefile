SYSROOT = $(THEOS)/sdks/iPhoneOS13.1.sdk

ARCHS = armv7 arm64 arm64e

include /var/theos/makefiles/common.mk

TWEAK_NAME = Infinitum
Infinitum_CFLAGS = "-DTHEOS_LEAN_AND_MEAN"
Infinitum_FILES = Tweak.xm
Infinitum_FRAMEWORKS = UIKit

include /var/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

