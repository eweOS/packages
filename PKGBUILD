# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libusb
pkgver=1.0.26
pkgrel=1
pkgdesc="Library that provides generic access to USB devices"
arch=(x86_64 aarch64)
url="https://libusb.info/"
license=(LGPL2.1)
depends=(musl libudev)
provides=(libusb-1.0.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('fcdb85c98f21639668693c2fd522814d440972d65883984c4ae53d0555bdbdb7e8c7a32199cd4b01113556a1eb5be7841b750cc73c9f6bda79bfe1af80914e71')

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
