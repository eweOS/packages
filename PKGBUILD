# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=karchive
pkgver=6.6.0
pkgrel=1
pkgdesc='Qt addon providing access to numerous types of archives'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('51e9d21cb87e2241bca6a69e1496661d05d00a581107bfcf9859aa9e70acac1b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
