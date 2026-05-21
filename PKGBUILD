# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=networkmanager-qt
pkgver=6.20.0
pkgrel=2
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
sha256sums=('6856fecb2933abcdad0a789a179e4054cf24901dc29f943f0036a3e15cf43e86')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
