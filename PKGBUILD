# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=proj
pkgver=9.9.0
pkgrel=1
pkgdesc="Cartographic Projections and Coordinate Transformations Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://proj.org/"
license=(MIT)
depends=(curl libtiff sqlite)
makedepends=(cmake gmock gtest)
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('791a0610547eeabb17006cfd49cdbd2034f3240f47ed5e88a1031811f4e2bcf3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_EXTERNAL_GTEST=ON
  cmake --build build
}

check(){
  ctest --test-dir build
}
            
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/COPYING -t "${pkgdir}"/usr/share/licenses/$pkgname/
}
