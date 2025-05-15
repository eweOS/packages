# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attica
pkgver=6.14.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='Qt library that implements the Open Collaboration Services API'
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('7c3556afeb0ae0e932c2e4d309df4905f3e2f41af3e3b38051b49d9f279357c1')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

