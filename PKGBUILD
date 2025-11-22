# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault

pkgname=scdoc
pkgver=1.11.4
pkgrel=1
license=('MIT')
pkgdesc='Tool for generating roff manual pages'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f8950bbef5213a89746185d5ed29fbee2502235632db883afaaac515dc87c60559bc1a39e2a3ea3bb019675e6039bd2d3b5c5d117a0ad022b61c958fb9407877')

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
