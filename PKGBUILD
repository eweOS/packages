# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kxmlgui
pkgver=6.20.0
pkgrel=3
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
             qt6-base-devel
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a16fd3734112914ef50ed2666a16905d87e67954bc368725ccb1d5b2edc8f8f1')

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
