# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze-icons
pkgver=6.17.0
pkgrel=1
pkgdesc='Breeze icon theme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(GPL-3.0-or-later LGPL-2.1-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules python-lxml)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4ffc75886e9a14a2a02da4871600b8c0b5a40756b8e99cbecfb515696d93c3b8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

