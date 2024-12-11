# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.15.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('e5aedfe7c0b2443aa67882b4792d08814570e00dd82f719a35c922a0993f621e')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
