# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-wayland-protocols
pkgver=1.21.0
pkgrel=1
pkgdesc='Plasma Specific Protocols for Wayland'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL-2.0-or-later)
makedepends=(extra-cmake-modules qt6-base)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz
        fix-cmake-install-dir.patch)
sha256sums=('698a7b28b711270314e396e248ae86087cfeaed01372009063995be6e1dc85ba'
            '7b18eb38e6be301521c3fcac77210f65b8f8fa307e804595949c3b977f6c56e9')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
