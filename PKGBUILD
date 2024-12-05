# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=onetbb
pkgver=2022.0.0
pkgrel=1
pkgdesc='High level abstract threading library (oneAPI Threading Building Blocks)'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://uxlfoundation.github.io/oneTBB/'
license=('Apache')
depends=('hwloc')
makedepends=('cmake' 'ninja' 'python' 'swig' 'python-setuptools' 'linux-headers')
conflicts=('tbb')
provides=("tbb=$pkgver")
replaces=('tbb')
source=(https://github.com/uxlfoundation/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz enable-resumable.patch)
sha512sums=('c87b84964b2c323f61895a532968dfa6413a774c177cffbf6e798a07e74e8da5d449144875771df0a1b02657eeb2a7ae4d41c6c432dbf7ea50e3d5a9ea9f8cd3'
            '585efb64717deb5cb12c8dfb6c65214266e3f8cf1cdaf1032ee8e497c9303810c4137fb1575a926f11f14663c8bb907789726aaa668340e96de0dedb7393018d')

prepare() {
  _patch_ "oneTBB-$pkgver"
  
  cd "oneTBB-$pkgver"

  # enable-resumable.patch not reliable on loongarch64
  case "$CARCH" in
    loongarch64) patch -R -p1 < "$srcdir"/enable-resumable.patch;;
  esac

  sed -e "s@#define MALLOC_UNIXLIKE_OVERLOAD_ENABLED __linux__@@"  \
    -i src/tbbmalloc_proxy/proxy.h
}

build() {
  cmake -B build -S oneTBB-$pkgver -GNinja \
          -DTBB4PY_BUILD=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DTBB_STRICT=OFF \
          -DTBB4PY_BUILD=ON \
          -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

check() {
  cd build
  # FIXME: a dozen+ tests hang forever with no timeout
  # ctest -E test_partitioner
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/lib/python*
  cd oneTBB-$pkgver/python
  TBBROOT="$pkgdir"/usr python setup.py install --root="$pkgdir"
}
