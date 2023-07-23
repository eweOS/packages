# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=benchmark
pkgver=1.8.2
pkgrel=1
pkgdesc="A microbenchmark support library"
arch=(x86_64 aarch64)
url="https://github.com/google/benchmark"
license=('Apache')
depends=('llvm-libs')
makedepends=('cmake' 'python')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2aab2980d0376137f969d92848fbb68216abb07633034534fc8c65cc4e7a0e93')

build()
{
  cd $pkgname-$pkgver

  # build type Release won't ignore unused variables
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBENCHMARK_ENABLE_GTEST_TESTS=OFF

  cmake --build .
}

check()
{
  cd $pkgname-$pkgver
  # clang version unsupported for assembly test, see warning
  ctest -E ".*_assembly_.*"
}

package()
{
  cd $pkgname-$pkgver
  cmake --install . --prefix $pkgdir/usr
}
