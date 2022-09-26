# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault

pkgname=scdoc
pkgver=1.11.2
pkgrel=4
license=('MIT')
pkgdesc='Tool for generating roff manual pages'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make \
	    PREFIX=/usr \
	    LDFLAGS="$LDFLAGS" \
	    CFLAGS="$CFLAGS -Wno-strict-prototypes"
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
