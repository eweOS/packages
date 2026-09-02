# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=imath
pkgver=3.2.3
pkgrel=1
pkgdesc='A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
optdepends=('boost-libs: python bindings'
            'python: python bindings')
makedepends=(boost
             cmake
             python
             python-numpy)
source=(https://github.com/AcademySoftwareFoundation/Imath/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e10c12b3f21f45bf08e09d4215d9c7691368d747beebd840de0b6fefed2df9f8')

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
