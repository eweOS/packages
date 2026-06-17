# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=yosys-abc
pkgver=0.66
pkgrel=1
pkgdesc="System for Sequential Logic Synthesis and Formal Verification (Yosys' fork)"
url='https://github.com/YosysHQ/abc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("custom: ABC")
depends=(musl llvm-libs readline)
provides=(abc libabc.so)
# 0001: Under review, fix shared-library linking when LTO is enabled
#	https://github.com/berkeley-abc/abc/pull/495
# 0002: Under review, fix unknown type "int64_t" because of missing include of
#	stdint.h.
#	https://github.com/berkeley-abc/abc/pull/494
source=("https://github.com/YosysHQ/abc/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Makefile-Respect-LDFLAGS-when-linking-shared-library.patch"
	"0002-sat-bmc-Explicitly-include-stdint.h-if-necessary.patch")
sha256sums=('695d5e471e359305e1c33883016a1c790942e37d048bb000ae117ba6b5e37a11'
            '406192b2109abc76820ccd9e9f16142da1696b517593dca5ef642a8a10a81aff'
            'a9ad6b5d1f06d7ea77b18ae0ddac4b3c37c478d731ad4c2f9171abed3d3c5e69')

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
