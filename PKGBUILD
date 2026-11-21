# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=union
pkgver=6.8.3
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='A Qt style supporting both QtQuick and QtWidgets'
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL)
depends=(cxx-rust-cssparser
         kcolorscheme
         kconfig
         kcoreaddons
         kguiaddons
         kiconthemes
         kirigami
         qt6-base
         qt6-declarative
         zlib)
makedepends=(extra-cmake-modules
             git
             qt6-shadertools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('cebe4d33d23ee3125191ea11130db41f19d4fb9d82fea8c50518906a7ca5279a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_OUTPUT_QTWIDGETS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
