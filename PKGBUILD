# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=yosys-abc
pkgver=0.71
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
# 0003: Downstream, cecTranProof.h uses int64_t without including stdint.h
source=("https://github.com/YosysHQ/abc/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Makefile-Respect-LDFLAGS-when-linking-shared-library.patch"
	"0002-sat-bmc-Explicitly-include-stdint.h-if-necessary.patch"
	"0003-cecTranProof-Explicitly-include-stdint.h.patch")
sha256sums=('8e823bc268d4ccb64f30bdc5cda3e20b78813a9e27ab531f76a44eb74ca86270'
            '406192b2109abc76820ccd9e9f16142da1696b517593dca5ef642a8a10a81aff'
            'a9ad6b5d1f06d7ea77b18ae0ddac4b3c37c478d731ad4c2f9171abed3d3c5e69'
            '390af60b1a3416895bc3cd62ad3d77e0bf4bd8b4afe7716dad2fd995f4f09fa1')

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
