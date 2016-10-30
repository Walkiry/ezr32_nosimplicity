#!/bin/bash

TOOLCHAIN_PATH=$HOME/gcc-arm-none-eabi/
CROSS_COMPILE=$HOME/gcc-arm-none-eabi/bin/arm-none-eabi-


if [ ! -e $TOOLCHAIN_PATH ]; then
	mkdir -p $TOOLCHAIN_PATH
	cd /tmp
	wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2	
	tar -xf gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 -C $TOOLCHAIN_PATH
fi


