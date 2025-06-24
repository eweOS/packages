# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kitemviews
pkgver=6.15.0
pkgrel=1
pkgdesc='Widget addons for Qt Model/View'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('0f27d189147bb992b94e1a6a55ced62e2aaf5c5b3d83e41f26d6b0e269765780')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
