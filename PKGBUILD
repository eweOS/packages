# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kiconthemes
pkgver=6.6.0
pkgrel=2
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
sha256sums=('2d00b17929d886425395e96c4c18bf5e8dfbf3f1cac2dac199a6f2ac5af35b22')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

