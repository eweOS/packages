# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attica
pkgver=6.15.0
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
sha256sums=('e2d081f08d5e6a361836313b2091d4d5a7518c0f7bdaf7b53d2db970b5a0273f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

