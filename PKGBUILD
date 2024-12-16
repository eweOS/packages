# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcolorscheme
pkgver=6.9.0
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kguiaddons
         ki18n
         qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('71beaae08b294b5ebf25c5174a1d55cacdce5e8991e9167d143a448b9574281a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
