# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=networkmanager-qt
pkgver=6.32.0
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
sha256sums=('028134ebcb8aba0394377775a15741c8dc3fc33af9651508a6d819ac1e7f31a0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
