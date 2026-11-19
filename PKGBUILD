# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=onetbb
pkgver=2023.2.0
pkgrel=1
pkgdesc='High level abstract threading library (oneAPI Threading Building Blocks)'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://uxlfoundation.github.io/oneTBB/'
license=('Apache')
depends=('hwloc')
makedepends=('cmake' 'ninja' 'python' 'swig' 'python-setuptools' 'linux-headers' 'python-pip')
conflicts=('tbb')
provides=("tbb=$pkgver")
replaces=('tbb')
source=(https://github.com/uxlfoundation/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz enable-resumable.patch)
sha512sums=('4a960b9a8011e30887c71ce6bc7be429d57bc0de22435b5d6c3247e6b3d783c0a053adc6fa189a41076c6e913733bab417456a21d98633cc2f33283e1be58c87'
            '585efb64717deb5cb12c8dfb6c65214266e3f8cf1cdaf1032ee8e497c9303810c4137fb1575a926f11f14663c8bb907789726aaa668340e96de0dedb7393018d')

prepare() {
  _patch_ "oneTBB-$pkgver"
  
  cd "oneTBB-$pkgver"
  sed -e "s@#define MALLOC_UNIXLIKE_OVERLOAD_ENABLED __linux__@@"  \
    -i src/tbbmalloc_proxy/proxy.h
}

build() {
  cmake -B build -S oneTBB-$pkgver -GNinja \
	  -DTBB_TEST=OFF \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DTBB_STRICT=OFF \
          -DTBB4PY_BUILD=OFF \
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

  cd oneTBB-$pkgver/python
  TBBROOT="$pkgdir"/usr python setup.py install --root="$pkgdir"
}
