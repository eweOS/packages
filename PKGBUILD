# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=proj
pkgver=9.5.1
pkgrel=2
pkgdesc="Cartographic Projections and Coordinate Transformations Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://proj.org/"
license=(MIT)
depends=(curl libtiff sqlite)
makedepends=(cmake gmock gtest)
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3')

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
