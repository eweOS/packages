# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=soxr
pkgver=0.1.3
pkgrel=2
pkgdesc='High quality, one-dimensional sample-rate conversion library '
url='https://sourceforge.net/projects/soxr/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD LGPL2)
depends=(openmp)
makedepends=(cmake)
source=("https://github.com/chirlu/soxr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('db6ca1b1e8405c6ef92f8294fc123d910abf0a114003b3f0f13fa57a95fd62d0')
provides=(libsoxr-lsr.so libsoxr.so)

build () {
	case "$CARCH" in
	loongarch64)
		# Enable lsx (-march=la464) causes test failure
		export CFLAGS="$CFLAGS -march=loongarch64"
	esac

	cmake -S "soxr-$pkgver" -B build \
		-Wno-dev				\
		-DCMAKE_BUILD_TYPE=Release		\
		-DBUILD_TESTS=ON			\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DWITH_CR32=ON				\
		-DWITH_CR32S=ON				\
		-DWITH_CR64=ON				\
		-DWITH_CR64S=ON				\
		-DWITH_LSR_BINDINGS=ON			\
		-DWITH_OPENMP=ON			\
		-DWITH_PFFFT=ON				\
		-DWITH_VR32=ON
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	sed -n '18,52p;d' soxr-"$pkgver"/src/pffft.c > BSD_LICENSE
	_install_license_ BSD_LICENSE
}
