# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ksvg
pkgver=6.26.0
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
sha256sums=('f3a7412e227d13b1cafec91c1b58dd3f86980abefc08b2535b46bef362b4c07e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
