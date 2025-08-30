# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libkcddb
pkgver=25.08.0
pkgrel=1
pkgdesc='KDE CDDB library'
url='https://www.kde.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later
         LGPL-2.0-or-later)
depends=(kcmutils
         kconfig
         kcoreaddons
         ki18n
         kio
         kwidgetsaddons
         libmusicbrainz5
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('e6a8573f554cd920e6f828010cde8c4aaeac5b329029f76ca2fe4bd5495627ec')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
