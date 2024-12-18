# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweathercore
pkgver=24.12.0
pkgrel=1
pkgdesc='Library to facilitate retrieval of weather information including forecasts and alerts'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
url='https://invent.kde.org/libraries/kweathercore'
depends=(kholidays
         ki18n
         qt6-base
         qt6-positioning)
makedepends=(extra-cmake-modules
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('f3470faf4408e0e7a8c8d1a913d3f7bcff4bb04307963019cf98d27a522f7559')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
