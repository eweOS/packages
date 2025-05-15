# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kconfigwidgets
pkgver=6.14.0
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
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('02fee668592d52bb39294f999af67797d7977e3f1c61bb9c77c086730594319f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

