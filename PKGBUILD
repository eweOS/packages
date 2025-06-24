# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=benchmark
pkgver=1.9.4
pkgrel=1
pkgdesc="A microbenchmark support library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/google/benchmark"
license=('Apache')
depends=('llvm-libs')
makedepends=('cmake' 'python')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('b334658edd35efcf06a99d9be21e4e93e092bd5f95074c1673d5c8705d95c104')

build()
{
  cd $pkgname-$pkgver

  # build type Release won't ignore unused variables
  #
  # Assembly tests are disabled as they cannot be built or verified against
  # a newer Clang.
  # Reference: https://github.com/google/benchmark/issues/1966
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBENCHMARK_ENABLE_GTEST_TESTS=OFF \
    -DBENCHMARK_ENABLE_ASSEMBLY_TESTS=OFF

  cmake --build .
}

check()
{
  cd $pkgname-$pkgver
  ctest
}

package()
{
  cd $pkgname-$pkgver
  cmake --install . --prefix $pkgdir/usr
}
