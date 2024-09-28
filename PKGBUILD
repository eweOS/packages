# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpackage
pkgver=6.6.0
pkgrel=1
pkgdesc='Framework that lets applications manage user installable packages of non-binary assets'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('12d77241586dc12baa3aa2c65bcebea31604216b91b76d9aaaabf370673e9ed2')

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

