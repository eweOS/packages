# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=krunner
pkgver=6.20.0
pkgrel=2
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         ki18n
         kitemmodels
	 kwindowsystem
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('735b2cf153ed1bd223389f29b4b619319fbb310071dac6c7e9fadda1195d3a1c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

