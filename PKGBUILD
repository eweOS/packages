# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=threadweaver
pkgver=6.15.0
pkgrel=1
pkgdesc='High-level multithreading framework'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1ae0e593182c25ec8a9ee85777ab767b6c37b0f7e7a6851d4b6d49bfe03da1d0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
