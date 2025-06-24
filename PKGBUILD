# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kxmlgui
pkgver=6.15.0
pkgrel=1
pkgdesc='User configurable main windows'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kitemviews
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('40ce8d472d171a819806af0d5a68c3f91d596b5ae8b4b29c46592a0978d7c305')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
