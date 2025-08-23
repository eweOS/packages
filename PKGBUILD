# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libwebp
pkgver=1.6.0
pkgrel=2
pkgdesc='A library to encode and decode images in WebP format.'
url='https://chromium.googlesource.com/webm/libwebp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libjpeg libpng libtiff)
makedepends=(cmake)
source=("https://github.com/webmproject/libwebp/archive/refs/tags/v$pkgver.tar.gz")

build () {
	cmake -S libwebp-$pkgver -B build \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DBUILD_SHARED_LIBS=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ libwebp-$pkgver/COPYING
}

sha256sums=('93a852c2b3efafee3723efd4636de855b46f9fe1efddd607e1f42f60fc8f2136')
