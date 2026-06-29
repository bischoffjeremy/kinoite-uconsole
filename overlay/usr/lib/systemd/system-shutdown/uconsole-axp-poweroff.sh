#!/bin/sh
# uConsole CM4: actually cut the AXP221 PMIC rails at the end of shutdown.
# On this (Pi firmware -> u-boot -> GRUB -> ostree) boot path the rails aren't
# cut on a regular poweroff, so the battery keeps draining while "off". Setting
# the AXP soft-power-off bit (register 0x32, bit 7) over I2C shuts down reliably.
#
# system-shutdown hooks run last, after unmount, just before reboot(). Only run
# on poweroff/halt -- NEVER on reboot/kexec. "-f" is needed because the axp20x
# driver holds address 0x34.
case "$1" in
    poweroff|halt)
        /usr/bin/i2cset -y -f 0 0x34 0x32 0x80
        ;;
esac
