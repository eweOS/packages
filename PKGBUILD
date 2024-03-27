# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=extra-cmake-modules
pkgver=6.0.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
source=(https://download.kde.org/stable/frameworks/6.0/$pkgname-$pkgver.tar.xz)
sha256sums=('23992bf19db717156b7d6dd13118caa79fd57f090beb062e8308db3c09f70d0c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
