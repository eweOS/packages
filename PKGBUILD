# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libinput
pkgver=1.21.0
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev')
makedepends=('meson' 'wayland-protocols')
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('SKIP')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D documentation=false \
    -D libwacom=false \
    -D debug-gui=false \
    -D tests=false
  meson configure build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

