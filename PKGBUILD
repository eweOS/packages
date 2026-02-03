# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=prjtrellis
pkgver=1.4
_dbcommit=4dda149b9e4f1753ebc8b011ece2fe794be1281a # 2023.09.28
pkgrel=4
pkgdesc='Libraries and utilities for open-source toolchain of Lattice ECP5/MachXO2 series FPGAs'
url='https://prjtrellis.readthedocs.io/en/latest/index.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs boost-libs python)
makedepends=(cmake boost git)
provides=(libtrellis.so)
# 0001: Backport, don't look for boost component "system" to fix build with
#	boost 1.89 or later.
#	https://github.com/YosysHQ/prjtrellis/pull/258
source=("git+https://github.com/YosysHQ/prjtrellis.git#tag=$pkgver"
	"git+https://github.com/YosysHQ/prjtrellis-db.git#commit=$_dbcommit"
	"0001-Remove-Boost-system-component-lookup.patch")
sha256sums=('846ad5fb5f34c26c396d82f4b00d4c1efa6823dcc9f29c88d8647e4ee924721a'
            '14c5930b46a97eb2d8444b873e8fbe0f2af1cbb9bc3c421a1f298eee4120cdb9'
            '8efea2a58515de1b23e11b220b0cd87f6eab6adaaf72b1b1c2d53881490cb374')

prepare() {
	_patch_ "$pkgname"

	cd "$pkgname"

	git config submodule.database.url "$srcdir/prjtrellis-db"
	git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
	cmake -S "$pkgname/libtrellis" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_PYTHON=ON			\
		-DBUILD_SHARED=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname"/COPYING
}
