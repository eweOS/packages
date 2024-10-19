# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=lapack
pkgname=(blas
         cblas
         lapack
         lapacke
         blas64
         cblas64
         lapack64
         lapacke64)
pkgver=3.12.0
pkgrel=2
url='https://www.netlib.org/lapack'
pkgdesc='Linear Algebra PACKage'
makedepends=(cmake
             python
             flang)
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
source=(https://github.com/Reference-LAPACK/lapack/archive/v$pkgver/$pkgbase-$pkgver.tar.gz)
sha256sums=('eac9570f8e0ad6f30ce4b963f4f033f0f643e7c3912fc9ee6cd99120675ad48b')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=flang-new \
    -DLAPACKE_WITH_TMG=ON \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON \
    -DBUILD_MAN_DOCUMENTATION=ON
  cmake --build build

  cmake -B build64 -S $pkgbase-$pkgver \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=flang-new \
    -DLAPACKE_WITH_TMG=ON \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON \
    -DBUILD_INDEX64=ON
  cmake --build build64
}

package_lapack() {
  depends=(blas)
  
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  rm -r "$pkgdir"/usr/lib/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir"/usr/lib/pkgconfig/{blas.*,cblas.*,lapacke.*}
  rm -r "$pkgdir"/usr/lib/cmake/{cblas*,lapacke*}
  rm -r "$pkgdir"/usr/include
}

package_blas() {
  pkgdesc='Basic Linear Algebra Subprograms'

  DESTDIR="$pkgdir" cmake --install build/BLAS
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_cblas() {
  pkgdesc='C interface to BLAS'
  depends=(blas)

  DESTDIR="$pkgdir" cmake --install build/CBLAS
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_lapacke() {
  pkgdesc='C interface to LAPACK'
  depends=(lapack)

  DESTDIR="$pkgdir" cmake --install build/LAPACKE
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_lapack64() {
  pkgdesc='Linear Algebra PACKage (64-bit integers)'
  depends=(blas64)

  DESTDIR="$pkgdir" cmake --install build64
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  rm -r "$pkgdir"/usr/lib/{libblas64.*,libcblas64.*,liblapacke64.*}
  rm -r "$pkgdir"/usr/lib/pkgconfig/{blas64.*,cblas64.*,lapacke64.*}
  rm -r "$pkgdir"/usr/lib/cmake/{cblas*,lapacke*}
  rm -r "$pkgdir"/usr/include
}

package_blas64() {
  pkgdesc='Basic Linear Algebra Subprograms (64-bit integers)'

  DESTDIR="$pkgdir" cmake --install build64/BLAS
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_cblas64() {
  pkgdesc='C interface to BLAS (64-bit integers)'
  depends=(blas64)
  optdepends=('cblas: development headers')

  DESTDIR="$pkgdir" cmake --install build64/CBLAS
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -r "$pkgdir"/usr/include # Provided by cblas
}

package_lapacke64() {
  pkgdesc='C interface to LAPACK (64-bit integers)'
  depends=(lapack64)
  optdepends=('lapacke: development headers')
 
  DESTDIR="$pkgdir" cmake --install build64/LAPACKE
  install -Dm644 $pkgbase-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -r "$pkgdir"/usr/include # Provided by lapacke
}
