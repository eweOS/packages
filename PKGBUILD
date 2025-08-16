# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kparts
pkgver=6.17.0
pkgrel=1
pkgdesc='Document centric plugin system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         ki18n
         kio
         kwidgetsaddons
         kxmlgui
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1e64d426ce47501a8ff1bac8c2366f0cd153e6cd4d440e827eb0015d9e38c3e9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
