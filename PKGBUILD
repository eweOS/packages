# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdnssd
pkgver=6.26.0
pkgrel=1
pkgdesc='Abstraction to system DNSSD features'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('8439daed9c4b942a74393daf23c8d97fdaabd81b93dc347f91bbb45a2bf85248')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
