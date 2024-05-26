# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.13.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('dd477e352f5ff6e6ac686286c4b22b19bf5a4921b85ee5a7da02bb7aa115d57e')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
