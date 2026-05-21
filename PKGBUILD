# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libkcddb
pkgver=25.12.2
pkgrel=2
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
sha256sums=('62c2815d4efd3695a9593d5353e5dbaeeefc6c5267b165aecb58220470ba2110')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
