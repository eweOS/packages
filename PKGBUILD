# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ktextwidgets
pkgver=6.20.0
pkgrel=2
pkgdesc='Advanced text editing widgets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         ki18n
         kwidgetsaddons
         qt6-base
         sonnet)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('781e7fad5720de7f31380b2c4a458bc2875940449ed9168b48c60d474b6df220')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_TEXT_TO_SPEECH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

