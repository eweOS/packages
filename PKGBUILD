# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwidgetsaddons
pkgver=6.14.0
pkgrel=1
pkgdesc='Addons to QtWidgets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('602720bc3e86cba2384f0f45e16c8524a1974796a3d5b7c5c1ed90e768cf121f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
