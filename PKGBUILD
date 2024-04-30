# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcodecs
pkgver=6.1.0
pkgrel=1
pkgdesc='Provide a collection of methods to manipulate strings using various encodings'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules gperf qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f1f0075955b2dd613b5c5f7999844ea1f9e0a09ff3f2cb230653ae9cbd843816')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
