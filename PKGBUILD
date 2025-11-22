# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=eigen
pkgver=5.0.1
pkgrel=1
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(any)
url='https://eigen.tuxfamily.org'
license=(MPL-2.0 Apache-2.0 BSD-3-Clause Minpack 'LGPL-2.1-only OR LGPL-2.1-or-later')
makedepends=(cmake flang suitesparse boost)
source=(https://gitlab.com/libeigen/eigen/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e9c326dc8c05cd1e044c71f30f1b2e34a6161a3b6ecf445d56b53ff1669e3dec')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DEIGEN_BUILD_LAPACK=OFF \
    -DEIGEN_BUILD_BLAS=OFF
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 $pkgname-$pkgver/COPYING.* -t "$pkgdir/usr/share/licenses/$pkgname"
}
