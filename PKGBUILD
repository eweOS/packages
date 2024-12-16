# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kiconthemes
pkgver=6.9.0
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
sha256sums=('e24d4b4f8bd09d6edd61e7dfb2033017352452eae879c1260200a81d48bc996e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

