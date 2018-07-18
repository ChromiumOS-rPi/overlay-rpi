# Copyright (c) 2017 Flint Innovations Limited. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Chrome OS Firmware"
HOMEPAGE="http://www.chromium.org/"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="arm"
IUSE=""
RESTRICT="mirror"

S=${WORKDIR}

SRC_URI="
	https://github.com/raspberrypi/firmware/archive/22de0bb68d34fd210ba9d086c6a1fc5e90f0bfbb.zip -> firmware-44.zip
	https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/86e88fbf0345da49555d0ec34c80b4fbae7d0cd3/brcm/brcmfmac43430-sdio.bin
	https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/86e88fbf0345da49555d0ec34c80b4fbae7d0cd3/brcm/brcmfmac43430-sdio.txt"

src_install() {
	# Install boot related.
	cd "firmware-22de0bb68d34fd210ba9d086c6a1fc5e90f0bfbb/boot"
	insinto /firmware/rpi
	doins *.dtb *.bin *.linux LICENCE.* *.linux *.elf *.dat

	cd "overlays"
	insinto /firmware/rpi/overlays
	doins *.*

	# Install WiFi firmware.
	insinto /lib/firmware/brcm
	doins ${DISTDIR}/brcmfmac43430-sdio.bin
	doins ${DISTDIR}/brcmfmac43430-sdio.txt
}
