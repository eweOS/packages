# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kcompletion
pkgver=6.20.0
pkgrel=2
pkgdesc='Text completion helpers and widgets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcodecs
         kconfig
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3b270003b661db894f50e9f90fdddd309c3ea97010e363bc551f752db6efcecc')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

