# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attica
pkgver=6.32.0
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
sha256sums=('4f2b525649c6a23924bdf2647e9cd6c591285d33d8d4f01db45b37622e3b839b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

