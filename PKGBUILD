# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=flashrom
pkgver=1.5.1
pkgrel=1
pkgdesc='A utility for detecting, reading, writing, verifying and erasing flash chips'
url='https://review.coreboot.org/admin/repos/flashrom,general'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
# missing: libpci
depends=(musl libusb libftdi)
# missing: python-sphinx
makedepends=(meson ninja linux-headers)
# checkdepends=(cmocka)
source=("https://github.com/flashrom/flashrom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5')

build() {
	# silence warnings:
	# linux_mtd.c:52:12: error: variable length array folded to constant
	# array as an extension [-Werror,-Wgnu-folding-constant]
	export CFLAGS="$CFLAGS -Wno-gnu-folding-constant"
	ewe-meson "$pkgname-$pkgver" build \
		--default-library static		\
		-Ddocumentation=disabled		\
		-Dllvm_cov=disabled			\
		-Dman-pages=disabled			\
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
