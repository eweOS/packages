# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efibootmgr
pkgver=18
pkgrel=1
pkgdesc="Linux user-space application to modify the EFI Boot Manager"
arch=(x86_64)
url="https://github.com/rhboot/efibootmgr"
license=(GPL2)
depends=(musl popt)
makedepends=(efivar)
source=("https://github.com/rhboot/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('SKIP')

build() {
  make libdir=/usr/lib sbindir=/usr/bin EFIDIR=ewe -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" libdir=/usr/lib sbindir=/usr/bin EFIDIR=ewe install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README,README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
