# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdnssd
pkgver=6.20.0
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
sha256sums=('fc616e7f9d56ff4304a5bdc6d04e7ef75e5ff7d84375175f0b25a44ba89af60a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
