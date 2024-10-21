# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcodecs
pkgver=6.6.0
pkgrel=2
pkgdesc='Provide a collection of methods to manipulate strings using various encodings'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules gperf qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d9dc2e3294aa32684990bde01bb88dedb2610a28d7c1d62a178a393fa566123b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
