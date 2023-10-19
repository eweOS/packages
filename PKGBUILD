# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=soxr
pkgver=0.1.3
pkgrel=0
pkgdesc='High quality, one-dimensional sample-rate conversion library '
url='https://sourceforge.net/projects/soxr/'
arch=(x86_64 aarch64 riscv64)
license=(BSD LGPL2)
depends=(openmp)
makedepends=(cmake)
source=("https://github.com/chirlu/soxr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('db6ca1b1e8405c6ef92f8294fc123d910abf0a114003b3f0f13fa57a95fd62d0')
provides=(libsoxr-lsr.so libsoxr.so)

build () {
	mkdir soxr-$pkgver/build
	cd soxr-$pkgver/build
	cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release	\
		-DBUILD_TESTS=ON			\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DWITH_CR32=ON				\
		-DWITH_CR32S=ON				\
		-DWITH_CR64=ON				\
		-DWITH_CR64S=ON				\
		-DWITH_LSR_BINDINGS=ON			\
		-DWITH_OPENMP=ON			\
		-DWITH_PFFFT=ON				\
		-DWITH_VR32=ON				\
		..
	make
}

check() {
	cd soxr-$pkgver/build
	make test
}

package() {
	cd soxr-$pkgver/build
	make install DESTDIR=$pkgdir
	sed -n '18,52p;d' ../src/pffft.c > BSD_LICENSE
	install BSD_LICENSE -Dm644 $pkgdir/usr/share/licenses/soxr/BSD_LICENSE
}
