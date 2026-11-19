# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kconfigwidgets
pkgver=6.32.0
pkgrel=1
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
sha256sums=('9d7f60aec2c8153e944d0916852942abb7a28459146b1383f3c540e49dd3da8d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

