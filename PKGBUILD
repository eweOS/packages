# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweather
pkgver=24.12.0
pkgrel=1
pkgdesc='Weather application for Plasma Mobile'
url='https://apps.kde.org/kweather/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(kconfig
         kcoreaddons
         ki18n
         kirigami
         kirigami-addons
         kweathercore
         libplasma
         qt6-base
         qt6-charts
         qt6-declarative)
makedepends=(extra-cmake-modules
             python)
groups=(kde-applications
        kde-utilities)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('9acb898f082a5b6fc3187366c12d51dde75c8b50ad785005f3eadf8c2ea19a34')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
