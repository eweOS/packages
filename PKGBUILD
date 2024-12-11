# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openjpeg2
pkgver=2.5.3
pkgrel=1
pkgdesc='An open-source JPEG 2000 codec written in C.'
url='https://www.openjpeg.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(libtiff libpng lcms2 zlib)
provides=(libopenjp2.so)
source=("https://github.com/uclouvain/openjpeg/archive/refs/tags/v$pkgver.tar.gz")

build () {
	cd openjpeg-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib . \
              -DBUILD_STATIC_LIBS=OFF 
	make
}

package() {
	cd openjpeg-$pkgver
	make install DESTDIR=${pkgdir}
	_install_license_ LICENSE
#	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/openjpeg2/LICENSE
}

sha256sums=('368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707')
