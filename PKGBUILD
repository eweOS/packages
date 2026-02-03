# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=yosys-abc
pkgver=0.61
pkgrel=1
pkgdesc="System for Sequential Logic Synthesis and Formal Verification (Yosys' fork)"
url='https://github.com/YosysHQ/abc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("custom: ABC")
depends=(musl llvm-libs readline)
provides=(abc libabc.so)
# 0001: Under review, fix shared-library linking when LTO is enabled
#	https://github.com/YosysHQ/abc/pull/38
source=("https://github.com/YosysHQ/abc/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Makefile-Respect-LDFLAGS-when-linking-shared-library.patch")
sha256sums=('617fe0cd8fbccb5580fc5dbf85fcbb5b0b66ec86f5b220f8de21e9f95650f685'
            '406192b2109abc76820ccd9e9f16142da1696b517593dca5ef642a8a10a81aff')

prepare() {
	_patch_ "abc-$pkgver"
}

build() {
	cd "abc-$pkgver"

	make ABC_USE_PIC=1 abc libabc.so
}

# > Final remarks:
# > Unfortunately, there is no comprehensive regression test. Good luck!
# -- The README

package() {
	cd "abc-$pkgver"

	install -Dm755 abc "$pkgdir/usr/bin/abc"
	install -Dm755 libabc.so "$pkgdir/usr/lib/libabc.so"
	_install_license_ copyright.txt
}
