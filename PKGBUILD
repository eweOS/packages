# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=karchive
pkgver=6.14.0
pkgrel=1
pkgdesc='Qt addon providing access to numerous types of archives'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(libbz2
         qt6-base
         xz
         zlib
         zstd)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2cb2f54cb9f8132daf688a5d4acd7f4bec40203b01551ff06e6da1e9f87f0ef9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
