# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libkexiv2
pkgname=(libkexiv2)
pkgver=25.12.2
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
url='https://www.kde.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(exiv2)
makedepends=(extra-cmake-modules
             qt6-base)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('b8d914d03ca96b4e2d3a1707af424980a7f0685b109220b25efb76ed7e7778b6')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package_libkexiv2() {
  depends+=(qt6-base)

  DESTDIR="$pkgdir" cmake --install build
}
