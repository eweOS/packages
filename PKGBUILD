# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.17.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('cbd44b440e6b7cc76b650da93a870897e5a94adf7882b19fdf8fe222d4f74a4f')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
