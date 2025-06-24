# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcmutils
pkgver=6.15.0
pkgrel=1
pkgdesc='Utilities for interacting with KCModules'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kconfigwidgets
         kcoreaddons
         kguiaddons
         ki18n
         kio
         kirigami
         kitemviews
         kservice
         kwidgetsaddons
         kxmlgui
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('56e7a7648651ce9698ea7d1ff98b7fec6598111d37d2f28ae0d6547d3c98ff04')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

