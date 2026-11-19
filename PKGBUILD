# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kauth
pkgver=6.32.0
pkgrel=1
pkgdesc='Abstraction to system policy and authentication features'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcoreaddons
         kwindowsystem
         qt6-base)
makedepends=(extra-cmake-modules qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5bcdb298a2ee84bca93a989247fd6d6e34a1e1029caae17705a85b8ac4dbe837')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

