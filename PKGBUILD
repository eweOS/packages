# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwidgetsaddons
pkgver=6.26.0
pkgrel=1
pkgdesc='Addons to QtWidgets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('65044882e30b305fe9fb20331a354cd811ca9d80b5c7f9fa722639f3334fe630')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_PYTHON_BINDINGS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
