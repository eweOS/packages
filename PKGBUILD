# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kirigami-addons
pkgver=1.16.1
pkgrel=1
pkgdesc='Add-ons for the Kirigami framework'
url='https://invent.kde.org/libraries/kirigami-addons'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kirigami
         kitemmodels
         ksvg
         qt6-base
         qt6-declarative
         qqc2-desktop-style
         qt6-multimedia
         sonnet)
makedepends=(extra-cmake-modules qt6-tools)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('124b01267acf603c3afd9fb9599a33fee7a28d65756890163e9593a3932084dd')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
