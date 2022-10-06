# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libburn
pkgver=1.5.4 # .pl01
pkgrel=1
pkgdesc="Library for reading, mastering and writing optical discs"
arch=('x86_64')
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('musl')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
options=('!emptydirs')
sha256sums=('SKIP')

build() {
	cd "${pkgname}-${pkgver/.pl01/}"
	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd "${pkgname}-${pkgver/.pl01/}"
	make DESTDIR="${pkgdir}" install
}
