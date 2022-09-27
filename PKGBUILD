# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oed
pkgver=7.1
pkgrel=1
pkgdesc="Portable version of the OpenBSD ed text editor"
arch=(x86_64)
url="https://github.com/ibara/oed"
license=('BSD' 'ISC')
depends=('musl')
source=("https://github.com/ibara/oed/archive/refs/tags/oed-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
	cd $pkgname-$pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--program-name=$pkgname
	make
}

package() {
	cd $pkgname-$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

