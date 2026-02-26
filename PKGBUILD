# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=proj
pkgver=9.7.1
pkgrel=1
pkgdesc="Cartographic Projections and Coordinate Transformations Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://proj.org/"
license=(MIT)
depends=(curl libtiff sqlite)
makedepends=(cmake gmock gtest)
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6c097dc803c561929cdfcc46e4bf9945ea977611fb31493ad14e88edaeae260f')

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
