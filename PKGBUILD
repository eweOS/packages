# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=frameworkintegration
pkgver=6.32.0
pkgrel=1
pkgdesc='Framework providing components to allow applications to integrate with a KDE Workspace'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcolorscheme
         kconfig
         kiconthemes
         knotifications
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('874e13434e808cb0b2081af0f993e09236d0c3e44a6ae37d4fe724ee7547a912')

build() {
  # BUILD_KPACKAGE_INSTALL_HANDLERS=OFF: packagekit requires polkit
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_KPACKAGE_INSTALL_HANDLERS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
