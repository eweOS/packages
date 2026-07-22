# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrt
pkgver=1.5.6
pkgrel=1
pkgdesc='Secure Reliable Transport (SRT)'
url='https://www.srtalliance.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
depends=(openssl)
makedepends=(cmake ninja linux-headers)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Haivision/srt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c4980c2c4cfd142d21b829d939dc51db9c6628af5967fff62fd7290769569c7')

build () {
	cmake srt-$pkgver -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_BUILD_TYPE=Release	\
		-DENABLE_TESTING=ON
	cmake --build build
}

check() {
  cd build
  ./uriparser-test
  ./utility-test
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ srt-$pkgver/LICENSE
}
