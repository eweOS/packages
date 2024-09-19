# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.14.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('1a4385ecfc79f7589f07381cab11c3ff51f6e2fa4b73b78600d6ad096394bf81')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
