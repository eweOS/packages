# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kitemviews
pkgver=6.6.0
pkgrel=1
pkgdesc='Widget addons for Qt Model/View'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a7a430c0c37b6781774ab7ee0845f9be0901424a5ed51d15e5b5b350d0cbee6e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
