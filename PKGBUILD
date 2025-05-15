# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kglobalaccel
pkgver=6.14.0
pkgrel=1
pkgdesc='Add support for global workspace shortcuts'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e7aaca16bb4c5b5865af3ed4b48f2347c5163065d17c2b24be97752ff5e8c71d')

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
