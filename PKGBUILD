# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=suitesparse
pkgname=(suitesparse
         suitesparse-graphblas)
pkgver=7.12.2
pkgrel=2
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(blas
         gmp
         lapack
         mpfr
         openmp)
makedepends=(cmake
             flang
             git)
license=(GPL)
source=(git+https://github.com/DrTimothyAldenDavis/SuiteSparse#tag=v$pkgver)
sha256sums=('ab598c5e010e48a5013d5c35a4fb177673e1ea0595b51d4dbc83ed138fb09d0b')

build() {
  cd SuiteSparse
  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
                 -DCMAKE_INSTALL_PREFIX=/usr \
                 -DCMAKE_BUILD_TYPE=None \
                 -DCMAKE_Fortran_COMPILER=flang-new \
                 -DNSTATIC=ON" \
  make
}

package_suitesparse() {
  cd SuiteSparse
  DESTDIR="$pkgdir" make install

  rm -r "$pkgdir"/usr/lib/lib{graphblas,lagraph,lagraphx}.so* \
        "$pkgdir"/usr/include/suitesparse/{GraphBLAS,LAGraph,LAGraphX}.h \
        "$pkgdir"/usr/lib/cmake/{GraphBLAS,LAGraph} \
        "$pkgdir"/usr/lib/pkgconfig/{GraphBLAS,LAGraph}.pc
}

package_suitesparse-graphblas() {
  pkgdesc='Graph algorithms in the language of linear algebra'

  cd SuiteSparse
  DESTDIR="$pkgdir" make install -C GraphBLAS
  DESTDIR="$pkgdir" make install -C LAGraph
}
