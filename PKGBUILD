# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knotifyconfig
pkgver=6.6.0
pkgrel=1
pkgdesc='Configuration system for KNotify'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('e032fc8ebd375cd406dfef3038ebd49d7c1d1de7c79b7cad4cccf00285006f1f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

