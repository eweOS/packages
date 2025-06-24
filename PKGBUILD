# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kiconthemes
pkgver=6.15.0
pkgrel=1
pkgdesc='Support for icon themes'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(breeze-icons
         karchive
         kcolorscheme
         kconfig
         kconfigwidgets
         ki18n
         kwidgetsaddons
         qt6-base
         qt6-svg)
makedepends=(extra-cmake-modules
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('8842703899722f9ab6b4aec0b45c38bee9896e32daccb3eb17ef014404c9606b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

