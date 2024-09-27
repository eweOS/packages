# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kglobalaccel
pkgver=6.6.0
pkgrel=1
pkgdesc='Add support for global workspace shortcuts'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('49295ea5e4a018222a9b483e7c0fb8e7cfb4b761a92920b1e13454fd8f85fe81')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
