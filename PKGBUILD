# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=modemmanager-qt
pkgver=6.20.0
pkgrel=2
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
sha256sums=('1a606b26530de4d9c272cb9793b63b25e80fe7a9c0b61e422399453ff5e5ca79')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
