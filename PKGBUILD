# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libusb
pkgver=1.0.29
pkgrel=1
pkgdesc="Library that provides generic access to USB devices"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libusb.info/"
license=(LGPL2.1)
depends=(musl libudev)
makedepends=(linux-headers)
provides=(libusb-1.0.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('04f8bda8197c9ecf52709609b8fbfea762fd82ddb5cde153a7630b0e8ed557d42da8cbc44f2f593aa22fdd0762e16716300565d67adb0c5240d7f3723321f690')

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
