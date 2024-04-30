# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kguiaddons
pkgver=6.1.0
pkgrel=1
pkgdesc='Addons to QtGui'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules qt6-tools plasma-wayland-protocols)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('08d88452ae4bcdc073891499d9b414129cdc5982bd3bad88726dbef28ee5ac53')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
