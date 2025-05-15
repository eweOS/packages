# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpackage
pkgver=6.14.0
pkgrel=1
pkgdesc='Framework that lets applications manage user installable packages of non-binary assets'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(karchive
         kcoreaddons
         ki18n
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('fb2e260f7a2e2b4cfda4559881485899a77cf5fbc3b8ae05d06444bec82ed1ab')

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

