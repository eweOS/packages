# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kxmlgui
pkgver=6.17.0
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
sha256sums=('a1807169ca2c386a8d3e25cb2b066554e49663a6e3f632f1a1968ef5476430e3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
