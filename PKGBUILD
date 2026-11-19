# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze-icons
pkgver=6.32.0
pkgrel=1
pkgdesc='Breeze icon theme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(GPL-3.0-or-later LGPL-2.1-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules python-lxml)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3e14087f180ece104dbf9cb23f2c7140759b9dd7c35d8d9defdfcfdee538628f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

