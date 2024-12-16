# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=krunner
pkgver=6.9.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('eb4a5ee730b8d53641d8b08bdeb8d4bb065b19b6de3fa2ae9250436822f00d8c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

