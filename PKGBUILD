# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrt
pkgver=1.5.4
pkgrel=1
pkgdesc='Secure Reliable Transport (SRT)'
url='https://www.srtalliance.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL2)
depends=(openssl)
makedepends=(cmake ninja linux-headers)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Haivision/srt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0a8b600fe1b4eaaf6277530e3cfc8f15b8ce4035f16af4a5eb5d4b123640cdd')

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
