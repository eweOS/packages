# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kbookmarks
pkgver=6.6.0
pkgrel=1
pkgdesc='Support for bookmarks and the XBEL format'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kconfigwidgets
         kcoreaddons
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('32d0b4ca746db2b2bd2a4e5282f4acaba084b9ca104495a2b450b9ae2456b7d7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
