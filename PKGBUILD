# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libkexiv2
pkgname=(libkexiv2)
pkgver=24.12.0
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
url='https://www.kde.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(exiv2)
makedepends=(extra-cmake-modules
             qt6-base)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('27c7919d13ab7d481c064f115831fd4e276354bf1b61adf48350e28fab6730f6')

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
