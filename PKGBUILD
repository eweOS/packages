# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=geos
pkgver=3.13.1
pkgrel=1
pkgdesc="C/C++ library for computational geometry"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libgeos.org/"
license=(LGPL)
depends=(bash)
makedepends=(cmake)
options=(!emptydirs)
source=(https://download.osgeo.org/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_DOCUMENTATION=OFF \
    $extra_cmake_flags
  make -C build
}

check() {
  # https://github.com/libgeos/geos/issues/930/
  if [ "$CARCH" == "x86_64" ] || [ "$CARCH" == "riscv64" ]; then
    extra_ctest_flags="--exclude-regex unit-geom-Envelope"
  fi

  ctest --test-dir build --verbose $extra_ctest_flags
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
