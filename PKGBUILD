# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=imath
pkgver=3.1.11
pkgrel=1
pkgdesc='A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
optdepends=('boost-libs: python bindings'
            'python: python bindings')
makedepends=(boost
             cmake
             python)
source=(https://github.com/AcademySoftwareFoundation/Imath/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9057849585e49b8b85abe7cc1e76e22963b01bfdc3b6d83eac90c499cd760063')

build() {
  cmake -B build -S Imath-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 Imath-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
