# Copyright (c) 2017 Flint Innovations Limited. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

CROS_WORKON_REPO="https://github.com/FydeOS"
CROS_WORKON_PROJECT="kernel-raspberrypi"
CROS_WORKON_EGIT_BRANCH="test"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_COMMIT="11917b6e036edab766f7fd604b318a01ff2df373"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git-2 cros-kernel2 cros-workon

DESCRIPTION="Chrome OS Kernel- RPI"
KEYWORDS="arm"
KERNEL="kernel7"

DEPEND="!sys-kernel/chromeos-kernel-next
	!sys-kernel/chromeos-kernel
"
RDEPEND="${DEPEND}"

src_install() {
	cros-kernel2_src_install

	"${S}/scripts/mkknlimg" "$(cros-workon_get_build_dir)/arch/arm/boot/zImage" "${T}/kernel.img"

	insinto /firmware/rpi
	doins "${FILESDIR}"/{cmdline,config}.txt
	doins "${T}/kernel.img"
}
