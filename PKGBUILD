# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwidgetsaddons
pkgver=6.1.0
pkgrel=1
pkgdesc='Addons to QtWidgets'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('81225d7ec2d6ea738ded55fe41978deb639c3f77a2daad0eb2e5423aa046e4ce')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
