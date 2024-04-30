# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdbusaddons
pkgver=6.1.0
pkgrel=1
pkgdesc='Addons to QtDBus'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('b423a4ca1fcab973b9454386efbaf5dc2c642d21ee9125d73b8fc67f80463541')

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
