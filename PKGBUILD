# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knotifyconfig
pkgver=6.9.0
pkgrel=1
pkgdesc='Configuration system for KNotify'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         ki18n
         kio
         libcanberra
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('19b030477e609ff576d2d80886733af209b5d0d2384dd1d11877cb9dc380a489')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

