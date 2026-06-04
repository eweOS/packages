# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=syndication
pkgver=6.26.0
pkgrel=1
pkgdesc='RSS/Atom parser library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcodecs
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('6130b8bc976cb078eda34b833ecd558a156b4e6bc4cb55e57ac362cb2998ba47')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

