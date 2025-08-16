# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ksvg
pkgver=6.17.0
pkgrel=1
pkgdesc='Components for handling SVGs'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(karchive
         kcolorscheme
         kconfig
         kcoreaddons
         kguiaddons
         qt6-base
         qt6-svg)
makedepends=(extra-cmake-modules
             kirigami
             qt6-declarative
             qt6-tools)
optdepends=('kirigami: QML bindings'
            'qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3728da966932f20f190a545a7f42edea2f9bdbe6d727a5bc1b557ef5155b7f94')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
