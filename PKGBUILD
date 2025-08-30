# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libkexiv2
pkgname=(libkexiv2)
pkgver=25.08.0
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
url='https://www.kde.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(exiv2)
makedepends=(extra-cmake-modules
             qt6-base)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('9bb4e5858f35d0dba813ade3c0ff6e7fe750b0930d60a7f4609b48c9563d45eb')

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
