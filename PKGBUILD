# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweather
pkgver=25.08.0
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
sha256sums=('acd8d383abc97323a08283f5c34511d05a06b7019320d024968a01ccf6fe2106')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
