# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kconfigwidgets
pkgver=6.20.0
pkgrel=3
pkgdesc='Widgets for KConfig'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcodecs
         kcolorscheme
         kconfig
         kcoreaddons
         ki18n
         kwidgetsaddons
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-base-devel
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5c5e8dc7e986d85c3602b8a52b8d8909f91e7433ecad8037099491250f5f4e36')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

