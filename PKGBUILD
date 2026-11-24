# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdegraphics-mobipocket
pkgver=26.08.3
pkgrel=1
pkgdesc='A library to handle mobipocket files'
url='https://invent.kde.org/graphics/kdegraphics-mobipocket'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(qt6-5compat
         qt6-base)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('ea5d978c66332fd377f97d683b4c3902133f22b7aec586fcc9e810307f2f1f38')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
