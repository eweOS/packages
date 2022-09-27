# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libbsd
pkgver=0.11.6
pkgrel=2
pkgdesc='commonly-used BSD functions not implemented by all libcs'
arch=('x86_64')
url="https://libbsd.freedesktop.org"
license=('custom')
depends=('musl' 'libmd')
options=('staticlibs')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha512sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	# nlist failed, no solutions found
	sed -i 's/nlist//' test/Makefile.am
	./autogen
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	rm "${pkgdir}"/usr/lib/libbsd.a
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -f "${pkgdir}"/usr/share/man/man3/explicit_bzero.3
}
