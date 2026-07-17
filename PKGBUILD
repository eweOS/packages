# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault

pkgname=scdoc
pkgver=1.11.5
pkgrel=1
license=('MIT')
pkgdesc='Tool for generating roff manual pages'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('643209f9b5783d1792eeec2d1cf9ec0838d51adb1b507110aa10bf8963f1df816f6832cb0912a9e9ac698292f1a211dc99368e754636104f0f43f37fa61c179f')

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
