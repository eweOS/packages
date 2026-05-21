# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=imath
pkgver=3.2.2
pkgrel=2
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
sha256sums=('b4275d83fb95521510e389b8d13af10298ed5bed1c8e13efd961d91b1105e462')

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
