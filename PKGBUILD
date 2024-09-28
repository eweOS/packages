# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=taglib
pkgver=2.0.2
pkgrel=1
pkgdesc='A Library for reading and editing the meta-data of several popular audio formats'
arch=(x86_64 aarch64 riscv64)
url='https://taglib.github.io/'
license=(LGPL-2.1-only
         MPL-1.1)
depends=(sh
         zlib)
makedepends=(cmake
             git
             utf8cpp)
checkdepends=(cppunit)
source=(git+https://github.com/taglib/taglib#tag=v$pkgver)
sha256sums=('05ae54e76c2a1b259e17c5ba6f1d0a408759b02fe42af4b74e8eecaacef6a85e')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

