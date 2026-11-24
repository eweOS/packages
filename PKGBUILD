# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kweather
pkgver=26.08.3
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
sha256sums=('e60625ae9ae84fb621a3d95eb0186dba3bf821fecac5ad1c691418f8888b28ca')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
