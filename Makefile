VERSION = 0
PATCHLEVEL = 1
SUBLEVEL = 0

ARCH = cm0p

CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
  else if [ -x /bin/bash ]; then echo /bin/bash; \
  else echo sh; fi ; fi)
TOPDIR	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

HPATH   	= $(TOPDIR)/include
FINDHPATH	= $(HPATH)/asm 

HOSTCC  	=gcc
HOSTCFLAGS	=-O2 -fomit-frame-pointer

CROSS_COMPILE 	=

AS	=$(CROSS_COMPILE)as
LD	=$(CROSS_COMPILE)ld
CC	=$(CROSS_COMPILE)gcc -D__KERNEL__ -I$(HPATH)
CPP	=$(CC) -E
AR	=$(CROSS_COMPILE)ar
NM	=$(CROSS_COMPILE)nm
STRIP	=$(CROSS_COMPILE)strip
MAKE	=make

all:	do-it-all

do-it-all:	config



menuconfig: include/version.h symlinks 
	$(MAKE) -C scripts/lxdialog all
	@cp cpu/$(ARCH)/config.in .
	@sed -i -- "s/ARCH=.*/ARCH=$(ARCH)/g" scripts/Menuconfig 
	$(CONFIG_SHELL) scripts/Menuconfig cpu/$(ARCH)/config.in

include/version.h: ./Makefile
	@echo \#define UTS_RELEASE \"$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)\" > .ver
	@echo \#define NMSS_VERSION_CODE `expr $(VERSION) \\* 65536 + $(PATCHLEVEL) \\* 256 + $(SUBLEVEL)` >> .ver
	@mv -f .ver $@
 
symlinks:
	rm -f include/asm
	( cd include ; ln -sf ../cpu/$(ARCH)/include/asm asm)

config: symlinks
	$(CONFIG_SHELL) scripts/Configure cpu/$(ARCH)/config.in


