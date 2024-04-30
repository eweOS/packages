# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrt
pkgver=1.5.3
pkgrel=2
pkgdesc='Secure Reliable Transport (SRT)'
url='https://www.srtalliance.org/'
arch=(x86_64 aarch64 riscv64)
license=(MPL2)
depends=(openssl)
makedepends=(cmake ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Haivision/srt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('befaeb16f628c46387b898df02bc6fba84868e86a6f6d8294755375b9932d777')

build () {
	cmake srt-$pkgver -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ srt-$pkgver/LICENSE
}
