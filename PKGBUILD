# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libevdev
pkgver=1.13.3
pkgrel=1
pkgdesc="Wrapper library for evdev devices"
arch=(x86_64 aarch64 riscv64)
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:MIT)
depends=('musl')
makedepends=('meson' 'linux-headers')
provides=('libevdev.so')
source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf')

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
