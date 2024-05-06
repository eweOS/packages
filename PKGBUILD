# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ksvg
pkgver=6.1.0
pkgrel=1
pkgdesc='Components for handling SVGs'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('286a8e1ec8678d761960a3cd2b4c0e9dc837ef5e9b6396bc8d76b0feb71b6b5f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
