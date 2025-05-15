# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kiconthemes
pkgver=6.14.0
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
sha256sums=('a98cd231bfca420519d55b0b88e4e089b4e27ec79b4a8542b81de8a5ff8af6d5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

