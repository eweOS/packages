# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kguiaddons
pkgver=6.15.0
pkgrel=2
pkgdesc='Addons to QtGui'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules qt6-tools plasma-wayland-protocols wayland-protocols)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('56dcbab4c2309b28343bed73901c53071c409dfd0776840dd6dd92e2d470d7af')

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
