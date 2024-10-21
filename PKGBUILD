# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze-icons
pkgver=6.6.0
pkgrel=2
pkgdesc='Breeze icon theme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(GPL-3.0-or-later LGPL-2.1-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules python-lxml)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2d8ccc427ec864b6417eabe3aafe9b1f6857bf2a4fdcd0dc5c006413148e66d9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

