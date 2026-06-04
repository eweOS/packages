# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=networkmanager-qt
pkgver=6.26.0
pkgrel=1
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(networkmanager
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-declarative
             qt6-tools
             linux-headers)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a5cfed06af6156161f7fee56efe1521a6e9e26119327069f1799986f90b432e5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
