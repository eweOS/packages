# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=benchmark
pkgver=1.7.0
pkgrel=1
pkgdesc="A microbenchmark support library"
arch=(x86_64 aarch64)
url="https://github.com/google/benchmark"
license=('Apache')
depends=('llvm-libs')
makedepends=('cmake' 'python')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

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
