# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=pigz
pkgver=2.7
pkgrel=2
pkgdesc='Parallel implementation of the gzip file compressor'
arch=('x86_64')
url='https://www.zlib.net/pigz'
license=('custom')
depends=('zlib' 'musl')
source=(https://www.zlib.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('SKIP')

build() {
	cd $pkgname-$pkgver

	make pigz
}

check() (
	cd $pkgname-$pkgver

	make test
)

package() {
	cd $pkgname-$pkgver

	for i in pigz unpigz; do
		install -Dm755 $i  -t "$pkgdir"/usr/bin
	done
	install -Dm644 pigz.1 -t "$pkgdir"/usr/share/man/man1
	install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/README
}
