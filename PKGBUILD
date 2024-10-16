# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kstatusnotifieritem
pkgver=6.6.0
pkgrel=1
pkgdesc='Implementation of Status Notifier Items'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-or-later)
depends=(kwindowsystem
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f2522bd1de0b02160f78aae0150c48a9ed299186884fb99d0a6fb80549e409dd')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
