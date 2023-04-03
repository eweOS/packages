# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libevdev
pkgver=1.13.0
pkgrel=1
pkgdesc="Wrapper library for evdev devices"
arch=(x86_64 aarch64)
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:MIT)
depends=('musl')
makedepends=('meson')
provides=('libevdev.so')
source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('9edf2006cc86a5055279647c38ec923d11a821ee4dc2c3033e8d20e8ee237cd9')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D documentation=disabled \
    -D tests=disabled
  meson compile -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 $pkgname-$pkgver/COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
