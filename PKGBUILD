# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kguiaddons
pkgver=6.26.0
pkgrel=1
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
sha256sums=('8375342f852104f36fd72a6870eb9795183af4516592cd6fa73445ea6b813172')

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
