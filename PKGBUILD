# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdbusaddons
pkgver=6.15.0
pkgrel=1
pkgdesc='Addons to QtDBus'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('fccc1fef3c74590d28a3342cf756bb0ff87377336ca13662ef5daa7dafafe360')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
