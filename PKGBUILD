# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libusb
pkgver=1.0.28
pkgrel=1
pkgdesc="Library that provides generic access to USB devices"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libusb.info/"
license=(LGPL2.1)
depends=(musl libudev)
makedepends=(linux-headers)
provides=(libusb-1.0.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('0f4efa6b54e6195d2e5446652c2dc07358583e205d63bf438c4409511b8637d1700a71268c40499755747827d23cc730d9122267386f847bf781993c045c519f')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-udev
  make
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,ChangeLog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
