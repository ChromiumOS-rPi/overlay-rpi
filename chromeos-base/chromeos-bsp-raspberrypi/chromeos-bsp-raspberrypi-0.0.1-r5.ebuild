# Copyright (c) 2017 Flint Innovations Limited. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit udev

DESCRIPTION="Raspberry Pi bsp (meta package to pull in driver/tool dependencies)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="arm"
IUSE=""

DEPEND="
	chromeos-base/auto-expand-partition
"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	udev_dorules "${FILESDIR}/10-vchiq-permissions.rules"

	insinto /etc/sysctl.d
	doins ${FILESDIR}/99-rpi-tuning.conf

	insinto /etc/init
	doins ${FILESDIR}/rpi-tuning.conf
}
