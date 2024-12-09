# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=flashrom
pkgver=1.5.0
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
sha256sums=('53bfd0915c4a53f667c776ed73fe7da1892044d32a2be0bd398bd39a4e00edb3')

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
