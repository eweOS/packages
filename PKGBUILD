# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fftw
pkgname=(fftw)
pkgver=3.3.10
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.fftw.org/"
license=(GPL-2.0-or-later)
makedepends=(
  bash
  cmake
  flang
  openmp
  autoconf
)
source=(
  http://www.fftw.org/$pkgname-$pkgver.tar.gz
  cycle.h.patch
)
sha512sums=('2d34b5ccac7b08740dbdacc6ebe451d8a34cf9d9bfec85a5e776e87adf94abfd803c222412d8e10fbaa4ed46f504aa87180396af1b108666cde4314a55610b40'
            '7da269fc43dabd02ae6fad2ebad92b07e06825b6b7c6f8987fc6444f02e0d55080db4ba6e401760e071f5c33015faf8c710f643636cab7a79bdf1af5d434dbb4')
_build_types=(single double long-double)
_soname=3.6.10

prepare() {
  _patch_ $pkgname-$pkgver

  local _i

  # fix wrong soname in FFTW3LibraryDepends.cmake
  sed -e "s/3.6.9/$_soname/" -i $pkgname-$pkgver/CMakeLists.txt

  cd $pkgname-$pkgver
  autoreconf -fiv
  cd ..

  mv -v $pkgname-$pkgver $pkgname-$pkgver-single
  for _i in {1..3}; do
    cp -av $pkgname-$pkgver-single $pkgname-$pkgver-"${_build_types[$_i]}"
  done
}

build() {
  local _name
  local _configure=(
    ./configure
    --prefix=/usr
    --enable-shared
    --enable-threads
    --disable-mpi
    --enable-openmp
  )
  local _configure_single=(
    --enable-single
  )
  local _configure_double=()
  local _configure_long_double=(
    --enable-long-double
  )
  local _cmake_options=(
    -B build
    -S $pkgname-$pkgver-$_build_types
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D ENABLE_OPENMP=ON
    -D ENABLE_THREADS=ON
    -D ENABLE_FLOAT=ON
    -D ENABLE_LONG_DOUBLE=ON
  )

  if [ "$CARCH" == "x86_64" ]; then
    _configure_single+=("--enable-sse" "--enable-avx")
    _configure_double+=("--enable-sse2" "--enable-avx")
    _cmake_options+=("-D ENABLE_SSE=ON" "-D ENABLE_SSE2=ON" "-D ENABLE_AVX=ON" "-D ENABLE_AVX2=ON")
  fi

  # create missing FFTW3LibraryDepends.cmake
  # https://bugs.archlinux.org/task/67604
  cmake "${_cmake_options[@]}"
  # fix broken IMPORTED_LOCATION: https://github.com/FFTW/fftw3/issues/130#issuecomment-1030280157
  sed -e 's|\(IMPORTED_LOCATION_NONE\).*|\1 "/usr/lib/libfftw3.so.3"|' -i build/FFTW3LibraryDepends.cmake

  export F77='flang-new'
  # use upstream default CFLAGS while keeping our -march/-mtune
  #CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

  for _name in "${_build_types[@]}"; do
    (
      cd $pkgname-$pkgver-$_name
      case $_name in
        single)
        "${_configure[@]}" "${_configure_single[@]}"
        ;;
        double)
        "${_configure[@]}" "${_configure_double[@]}"
        ;;
        long-double)
        "${_configure[@]}" "${_configure_long_double[@]}"
        ;;
      esac
      # fix overlinking because of libtool
      sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    )
  done

  for _name in "${_build_types[@]}"; do
    make -C $pkgname-$pkgver-$_name
  done
}

check() {
  local _name

  for _name in "${_build_types[@]}"; do
    make check-local -C $pkgname-$pkgver-$_name/tests
  done
}

package_fftw() {
  depends=(
    bash
  )
  optdepends=('fftw-openmpi: for OpenMPI integration')
  provides=(
    libfftw3l_threads.so
    libfftw3l_omp.so
    libfftw3l.so
    libfftw3f_threads.so
    libfftw3f_omp.so
    libfftw3f.so
    libfftw3_threads.so
    libfftw3_omp.so
    libfftw3.so
  )

  local _name

  for _name in "${_build_types[@]}"; do
    make DESTDIR="$pkgdir" install -C $pkgname-$pkgver-$_name
  done
  install -vDm 644 $pkgname-$pkgver-$_build_types/{AUTHORS,ChangeLog,NEWS,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname"
  # install missing FFTW3LibraryDepends.cmake
  install -vDm 644 build/FFTW3LibraryDepends.cmake -t "$pkgdir/usr/lib/cmake/fftw3/"
}
