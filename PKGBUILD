# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault

pkgname=scdoc
pkgver=1.11.3
pkgrel=1
license=('MIT')
pkgdesc='Tool for generating roff manual pages'
arch=(x86_64 aarch64 riscv64)
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('fbecc505b44c396890c53c05183d34336160dbd02993ee120421fc6e2a3ec78ba349747e8acfe97af956a0081c923309290ff97fb7babafbc3ca8addc9ec92f9')

build()
{
  cd "$pkgname-$pkgver"
  make \
    PREFIX=/usr \
    LDFLAGS="$LDFLAGS" \
    CFLAGS="$CFLAGS -Wno-strict-prototypes"
}

check()
{
  cd "$pkgname-$pkgver"
  make check
}

package()
{
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
