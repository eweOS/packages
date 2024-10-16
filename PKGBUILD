# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=geos
pkgver=3.12.2
pkgrel=1
pkgdesc="C/C++ library for computational geometry"
arch=(x86_64 aarch64 riscv64)
url="https://libgeos.org/"
license=(LGPL)
depends=(bash)
makedepends=(cmake)
options=(!emptydirs)
source=(https://download.osgeo.org/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('34c7770bf0090ee88488af98767d08e779f124fa33437e0aabec8abd4609fec6')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_DOCUMENTATION=OFF \
    $extra_cmake_flags
  make -C build
}

check() {
  # https://github.com/libgeos/geos/issues/930/
  if [ "$CARCH" == "x86_64" ]; then
    extra_ctest_flags="--exclude-regex unit-geom-Envelope"
  fi

  ctest --test-dir build --verbose $extra_ctest_flags
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
