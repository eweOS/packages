# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdeclarative
pkgver=6.15.0
pkgrel=1
pkgdesc='Provides integration of QML and KDE Frameworks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kguiaddons
         kglobalaccel
         kguiaddons
         ki18n
         kwidgetsaddons
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules qt6-shadertools qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3727480f3c3e36c88241ccbcae8ac4078ff01e669114095afcad9ee14baa009d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
