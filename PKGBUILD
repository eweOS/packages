# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweathercore
pkgver=24.08.2
pkgrel=1
pkgdesc='Library to facilitate retrieval of weather information including forecasts and alerts'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
url='https://invent.kde.org/libraries/kweathercore'
depends=(kholidays
         ki18n
         qt6-base
         qt6-positioning)
makedepends=(extra-cmake-modules
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('3e390cc98835952360c6416fbdeeed75b873cc2dbfc0cb5fdc2c72b93b67fb18')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
