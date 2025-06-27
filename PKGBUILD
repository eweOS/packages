# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kirigami-addons
pkgver=1.8.1
pkgrel=2
pkgdesc='Add-ons for the Kirigami framework'
url='https://invent.kde.org/libraries/kirigami-addons'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
makedepends=(extra-cmake-modules qt6-tools)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('00028ae4df99e250518345ea28d9cdf49d700e9acac482734bb51384da11f945')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
