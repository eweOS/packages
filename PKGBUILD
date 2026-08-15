# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=benchmark
pkgver=1.9.5
pkgrel=3
pkgdesc="A microbenchmark support library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/google/benchmark"
license=('Apache-2.0')
depends=('musl' 'llvm-libs')
makedepends=('cmake' 'python')
provides=('libbenchmark.so' 'libbenchmark_main.so')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9631341c82bac4a288bef951f8b26b41f69021794184ece969f8473977eaa340')

build() {
  cd $pkgname-$pkgver

  # build type Release won't ignore unused variables
  #
  # Assembly tests are disabled as they cannot be built or verified against
  # a newer Clang.
  # Reference: https://github.com/google/benchmark/issues/1966
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBENCHMARK_ENABLE_GTEST_TESTS=OFF \
    -DBENCHMARK_ENABLE_ASSEMBLY_TESTS=OFF

  cmake --build .
}

check() {
  cd $pkgname-$pkgver
  ctest
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install .
  _install_license_ LICENSE
}
