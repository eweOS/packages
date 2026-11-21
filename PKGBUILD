# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=baloo-widgets
pkgver=26.08.3
pkgrel=1
pkgdesc='Widgets for Baloo'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.kde.org/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         baloo
         kconfig
         kcoreaddons
         kfilemetadata
         ki18n
         kio
         kservice
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('7274daae2ccfac64f79752443ee797d80e550f33beabebd5ed93bcc989a56f53')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
