# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kirigami-addons
pkgver=1.5.0
pkgrel=1
pkgdesc='Add-ons for the Kirigami framework'
url='https://invent.kde.org/libraries/kirigami-addons'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(kconfig
         kcoreaddons
         kglobalaccel
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         ksvg
         qt6-base
         qt6-declarative
         qt6-multimedia
         sonnet)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('f9dfd191022b633ea3348f84730d7158a159dfe49668dba0a9e9bd678ac44e54')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
