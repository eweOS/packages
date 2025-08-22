# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=modemmanager-qt
pkgver=6.17.0
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(llvm-libs
         musl
         modemmanager
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('b41fe1dd9a0e146adb4d8098d569d6b11291f40c90df70dfbaa6ad1654e18d76')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
