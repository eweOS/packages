# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcolorscheme
pkgver=6.1.0
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kguiaddons
         ki18n
         qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('c30aa87f3a606807c4068dab0080392bdca49f8fbef18553e1a7de0f7c5b036a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
