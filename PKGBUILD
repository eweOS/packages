# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweathercore
pkgver=26.08.3
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
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('9a22fee16ba887b200c46e5add3e7250e05aa1df97768145390eaf6677e7f485')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
