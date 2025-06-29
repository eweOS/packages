# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=prjtrellis
pkgver=1.4
_dbcommit=4dda149b9e4f1753ebc8b011ece2fe794be1281a # 2023.09.28
pkgrel=1
pkgdesc='Libraries and utilities for open-source toolchain of Lattice ECP5/MachXO2 series FPGAs'
url='https://prjtrellis.readthedocs.io/en/latest/index.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs boost-libs python)
makedepends=(cmake boost)
provides=(libtrellis.so)
source=("git+https://github.com/YosysHQ/prjtrellis.git#tag=$pkgver"
	"git+https://github.com/YosysHQ/prjtrellis-db.git#commit=$_dbcommit")
sha256sums=('846ad5fb5f34c26c396d82f4b00d4c1efa6823dcc9f29c88d8647e4ee924721a'
            '14c5930b46a97eb2d8444b873e8fbe0f2af1cbb9bc3c421a1f298eee4120cdb9')

prepare() {
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
