# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kparts
pkgver=6.32.0
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
sha256sums=('f2e437b038a0b0b3c40f0dfc81eb5689542c2d4e1f6025436a29e17f11caa79d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
