# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=proj
pkgver=9.6.0
pkgrel=1
pkgdesc="Cartographic Projections and Coordinate Transformations Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://proj.org/"
license=(MIT)
depends=(curl libtiff sqlite)
makedepends=(cmake gmock gtest)
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d8cae521c311c39513193657e75767f7cfbf2f91bd202fcd4a200028d3b57e14')

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
