# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdeclarative
pkgver=6.14.0
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
sha256sums=('ed0aa62653fe5a09bc44f584faaa633cb386f7a106cf9b5c930122ae86c0a1d0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
