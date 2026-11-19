# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kglobalaccel
pkgver=6.32.0
pkgrel=1
pkgdesc='Add support for global workspace shortcuts'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d5ad10eb041ef8f46074bb1df4cf3475888421d849bc667a7afc6c5bf8cc1640')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
