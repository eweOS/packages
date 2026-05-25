# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libusb
pkgver=1.0.30
pkgrel=1
pkgdesc="Library that provides generic access to USB devices"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libusb.info/"
license=(LGPL2.1)
depends=(musl libudev)
makedepends=(linux-headers)
provides=(libusb-1.0.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('b14241bc499cdf353bb7fe02cea9a754b011f40ef0d0376ff8921f129f888b514d481e54c6aa380be04f655e027aaf4d6d9eba142b15758dea2e32f64af7b0c2')

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
