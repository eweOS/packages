# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attica
pkgver=6.17.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='Qt library that implements the Open Collaboration Services API'
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2fab4a2d32e98f62465b81bda6e416ff7fa99d6aa494c4b261f8772758f6b71a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

