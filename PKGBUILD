# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=benchmark
pkgver=1.8.5
pkgrel=1
pkgdesc="A microbenchmark support library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/google/benchmark"
license=('Apache')
depends=('llvm-libs')
makedepends=('cmake' 'python')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('d26789a2b46d8808a48a4556ee58ccc7c497fcd4c0af9b90197674a81e04798a')

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
