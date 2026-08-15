# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openocd
pkgver=0.12.0
pkgrel=3
pkgdesc='Tool for on-chip programming and debugging'
url='https://openocd.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl libftdi libusb libhidapi libgpiod jimtcl libjaylink)
makedepends=(texinfo linux-uapi-headers)
options=(!lto)
# 0001: Backport, 95603fae18f8 ("openocd: revert workarounds for 'expr' syntax
#	change"), fix compilation with latest libjim
# 0002: Backport, bb073f897cd3 ("src: fix clang15 compiler warnings")
#	fix errors about deprecated style of function definiton
# 0003: Backport, 73390332d203 ("0003-openocd-fix-build-with-jimtcl-0.83.patch")
#	fix errors about unknown type "FILE" when building with jimtcl 0.83
# 0004: Backport, fe0080478b9e ("jimtcl: fix build with jimtcl master branch")
#	fix errors when building with jimtcl 0.84
source=("https://github.com/openocd-org/openocd/archive/refs/tags/v$pkgver.tar.gz"
	"0001-openocd-revert-workarounds-for-expr-syntax-change.patch"
	"0002-src-fix-clang15-compiler-warnings.patch"
	"0003-openocd-fix-build-with-jimtcl-0.83.patch"
	"0004-jimtcl-fix-build-with-jimtcl-master-branch.patch")
sha256sums=('0e2bcff1ef96f0591937220dcacfe7001069ddd823514dc4ba0ea2d33504e5b5'
            '9564fc057ef6be70c92d5efa69ebd7a2baf287c24de80dd745298a1f2380dc2d'
            '38cdc20d63c4309ed891c9d34ac9b2616c183c59d0bbf58860eb12381c53c45a'
            'a1e2bc98e07a65ada5d7315c5afa9a9cd72dbce2586cd2ecc33611a873f9d34d'
            'ff781c69431a007440ef3978553260a29c858230a13bb5568e7c6af22bc42336')

prepare() {
	_patch_ "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"

	# linuxgpiod is implemented through libgpiod v1 API, but eweOS ships only
	# v2. Let's disable it for now.
	./configure --prefix=/usr \
		--enable-shared			\
		--enable-static=no		\
		--enable-dummy			\
		--enable-rshim			\
		--enable-ftdi			\
		--enable-ti-icdi		\
		--enable-ulink			\
		--enable-usb-blaster-2		\
		--enable-ft232r			\
		--enable-vsllink		\
		--enable-xds110			\
		--enable-cmsis-dap-v2		\
		--enable-osbdm			\
		--enable-opendous		\
		--enable-armjtagaccel		\
		--enable-bcm2835gpio		\
		--enable-imx_gpio		\
		--enable-am335xgpio		\
		--enable-ep93xx			\
		--enable-at91rm9200		\
		--enable-gw16012		\
		--enable-xlnx-pcie-xvc		\
		--enable-remote-bitbang		\
		--enable-linuxgpiod=no		\
		--disable-internal-jimtcl	\
		--disable-internal-libjaylink
	make LIBTOOL="slibtool-shared"
}

check() {
	cd "$pkgname-$pkgver"

	make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
