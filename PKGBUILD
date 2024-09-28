# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcmutils
pkgver=6.6.0
pkgrel=1
pkgdesc='Utilities for interacting with KCModules'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('8f1b9f26ce7b055cec46a9521eab75f910ae9c395aada88d6d82cf395459b270')

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

