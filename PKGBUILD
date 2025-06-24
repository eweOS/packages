# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kpackage
pkgver=6.15.0
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
sha256sums=('5c9615bbd92af67e1bf147a29739a346a73b39ff3c4640f9e408d5430966612d')

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

