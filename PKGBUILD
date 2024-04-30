# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.12.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('1483bfd279cb913c83579b5d71c58f9958764f9ba4303b3647e1007cb70d4f9e')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
