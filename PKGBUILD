# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=networkmanager-qt
pkgver=6.15.0
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
sha256sums=('ac41786342b106fe7457d414e2d79289c6d720dcfaa58c271c50c8e4a754b39b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
