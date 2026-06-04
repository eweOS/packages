# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ktextwidgets
pkgver=6.26.0
pkgrel=1
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
sha256sums=('6511f9909f90fac951e2873a44dd451b8ac71d38085a62c65a6fb5028e62d84d')

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

