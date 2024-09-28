# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdegraphics-mobipocket
pkgver=24.08.1
pkgrel=1
pkgdesc='A library to handle mobipocket files'
url='https://invent.kde.org/graphics/kdegraphics-mobipocket'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(qt6-5compat
         qt6-base)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('0d94285fcd769043586700c332b82a972959efa63e1f74a8cea221658ffed032')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
