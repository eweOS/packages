# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=flashrom
pkgver=1.8.0
pkgrel=1
pkgdesc='A utility for detecting, reading, writing, verifying and erasing flash chips'
url='https://review.coreboot.org/admin/repos/flashrom,general'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl libusb libftdi pciutils libjaylink)
makedepends=(meson ninja linux-headers python-sphinx git)
# checkdepends=(cmocka)
source=("git+https://github.com/flashrom/flashrom.git#tag=v$pkgver")
sha256sums=('c370c329b6cec5e84320c40931fa6200cd72f4e16b6bb2a83e57dcbeb7bd0f54')

build() {
	# Fix Clang warnings about time_start/time_end in cli_classic.c is
	# uninitialized on some code paths, which otherwise will be lifted to
	# errors.
	# https://review.coreboot.org/c/flashrom/+/91491
	export CFLAGS="$CFLAGS -Wno-sometimes-uninitialized"
	ewe-meson "$pkgname" build \
		--default-library static		\
		-Dllvm_cov=disabled			\
		-Dtests=disabled
	meson compile -C build
}

# Disable check:
#	1. cmocka header has incomplete types (uintmax_t)
#	2/ current fails with SIGSEGV
# check() {
#	meson test -C build
# }

package() {
	# TODO: provide the udev rule (util/flashrom_udev.ruls)?
	meson install -C build --destdir="$pkgdir"
}
