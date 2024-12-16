# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdeclarative
pkgver=6.9.0
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
sha256sums=('1a266dd2a2912ffe632e455d823a76c9dbfb44977c07838bc44e457e5bec98eb')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
