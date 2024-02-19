# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libusb
pkgver=1.0.27
pkgrel=1
pkgdesc="Library that provides generic access to USB devices"
arch=(x86_64 aarch64 riscv64)
url="https://libusb.info/"
license=(LGPL2.1)
depends=(musl libudev)
provides=(libusb-1.0.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('42abbbcf2564f86cc2f05826aeefa6beb03c9f89dc9fe05bdfa351caa3dbd07713ce193daadecf29557604dd3cbc770c8031a78e1ad0a8df3627c3f551d28ff0')

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
