# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knotifyconfig
pkgver=6.32.0
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
sha256sums=('708e19857b4ac7ccf82541319d2a3bac30c1b451e79e4b0c71e6f58bc1b5307a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

