# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdiagram
pkgver=3.0.1
pkgrel=1
pkgdesc='Powerful libraries for creating business diagrams'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(GPL2)
depends=(qt6-base qt6-svg)
makedepends=(extra-cmake-modules
             qt6-tools)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('4659b0c2cd9db18143f5abd9c806091c3aab6abc1a956bbf82815ab3d3189c6d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

