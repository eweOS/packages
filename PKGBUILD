# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=eigen
pkgver=3.4.0
pkgrel=1
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(any)
url='https://eigen.tuxfamily.org'
license=(MPL-2.0 Apache-2.0 BSD-3-Clause Minpack 'LGPL-2.1-only OR LGPL-2.1-or-later')
makedepends=(cmake flang suitesparse boost)
source=(https://gitlab.com/libeigen/eigen/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
        eigen-vectorized-reduction-half.patch)
sha256sums=('8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72'
            'b1bdda30066451cee3e9b23f547bdc8fc8220ba166eac26343c3a5fed4e855ee')

prepare() {
  cd $pkgname-$pkgver
  # Eigen installs all files in source dir, including the backup files of patch.
  # With the first flag we disable the use of backup files.
  patch --no-backup-if-mismatch -Np1 -i ../$pkgname-vectorized-reduction-half.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 $pkgname-$pkgver/COPYING.* -t "$pkgdir/usr/share/licenses/$pkgname"
}
