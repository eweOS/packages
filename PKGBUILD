# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=yosys
pkgver=0.67
pkgrel=1
pkgdesc='An open framework for RTL synthesis tools'
url='https://yosyshq.net/yosys/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(musl llvm-libs abc tcl readline)
makedepends=(cxxopts python)
# checkdepends=(iverilog)
# 0001: Downstream, use system cxxopts to avoid fetching a submodule
# 0002: Downstream, remove -fuse-ld=lld from LINKFLAGS to build with mold when
#	LTO is enabled
source=("https://github.com/YosysHQ/yosys/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Use-system-cxxopts.patch"
	"0002-Use-default-linker-when-building-with-Clang.patch")
sha256sums=('8a29f915b9038eea0c84062ee11fce1357413a401b838807e66ca734c3153c44'
            '5ed9ab3de0a387fa88c4bc76c3ddbb97ea89cfc5df096e4c2c2621e642a1aa5e'
            '97db7b78a80c93c0bc4bff76f61c2a9e91140ceaf4a5d9227eb56e027b019977')

_makeargs=(CONFIG=clang
	   ENABLE_TCL=1
	   ENABLE_ABC=1
	   ENABLE_GLOB=1
	   ENABLE_LTO=1
	   ENABLE_PLUGINS=1
	   ENABLE_READLINE=1
	   ENABLE_COVER=1
	   ENABLE_ZLIB=1
	   ABCEXTERNAL=/usr/bin/abc
	   PREFIX=/usr)

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	make ${_makeargs[@]}
}

# Multiple tests fail.
# check() {
#	cd "$pkgname-$pkgver"
#
#	make ${_makeargs[@]} test
# }

package() {
	cd "$pkgname-$pkgver"

	make ${_makeargs[@]} install DESTDIR="$pkgdir"
}
