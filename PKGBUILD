# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kiconthemes
pkgver=6.20.0
pkgrel=3
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
             qt6-base-devel
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('61b906051cd66db1dd259ec76d08885d3fe749e0d3947aea749021d2c96537a5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

