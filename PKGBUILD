# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=krunner
pkgver=6.6.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         ki18n
         kitemmodels
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('17d4201be7ce712071d29e9528feafdc2be20391834a110c3584cc142c9f4b11')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

