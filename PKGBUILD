# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=proj
pkgver=9.8.1
pkgrel=1
pkgdesc="Cartographic Projections and Coordinate Transformations Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://proj.org/"
license=(MIT)
depends=(curl libtiff sqlite)
makedepends=(cmake gmock gtest)
source=(https://github.com/OSGeo/PROJ/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('af5b731c145c1d13c4e3b4eeb7d167e94e845e440f71e3496b4ed8dae0291960')

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
