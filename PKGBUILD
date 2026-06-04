# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kguiaddons
pkgver=6.20.0
pkgrel=3
pkgdesc='Addons to QtGui'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules qt6-base-devel qt6-tools plasma-wayland-protocols wayland-protocols)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('33caf5ae46f1a6214f56596180e0c6ccb4af2cce0dcae060ae4fb7078260a476')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_X11=OFF \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
