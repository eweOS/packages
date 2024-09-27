# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kguiaddons
pkgver=6.6.0
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
sha256sums=('bcaa36e4c046a4adadbe6bbb8649169c1b1b96ab68953e3ea1957d7b87c18331')

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
