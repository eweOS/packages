# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openjpeg2
pkgver=2.5.0
pkgrel=0
pkgdesc='An open-source JPEG 2000 codec written in C.'
url='https://www.openjpeg.org/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(libtiff libpng liblcms2 zlib)
source=("https://github.com/uclouvain/openjpeg/archive/refs/tags/v$pkgver.tar.gz")

build () {
	cd openjpeg-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd openjpeg-$pkgver
	make install DESTDIR=${pkgdir}
	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/openjpeg2/LICENSE
}

sha256sums=('0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a')
