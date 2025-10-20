# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontforge
pkgver=20251009
pkgrel=1
pkgdesc='Outline and bitmap font editor'
url='https://fontforge.github.io/'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD-3-Clause' 'GPL-3.0-or-later')
makedepends=('cmake' 'git' 'python-setuptools')
depends=('libtool' 'pango' 'giflib' 'libtiff' 'libxml2' 'libspiro' 'python'
         'potrace' 'woff2' 'gtk3' 'gtkmm3')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('69046500185a5581b58139dfad30c0b3d8128f00ebbfddc31f2fcf877e329e52')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_MAINTAINER_TOOLS=TRUE \
		-DENABLE_FONTFORGE_EXTRAS=TRUE \
		-DUNIX=TRUE
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
