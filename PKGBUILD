# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze-icons
pkgver=6.15.0
pkgrel=1
pkgdesc='Breeze icon theme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(GPL-3.0-or-later LGPL-2.1-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules python-lxml)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('25d92102f9554ea23eb6ee81434395b517d93fc86e5e0415834a7ff449ef855c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

