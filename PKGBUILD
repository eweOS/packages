# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=googletest
pkgver=1.15.0
pkgrel=1
pkgdesc='C++ testing utility based on the xUnit framework'
url='https://github.com/google/googletest'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('llvm-libs' 'sh')
makedepends=('python' 'cmake' 'llvm-libs' 'sh')
optdepends=('python: gmock generator')
provides=('gmock' 'gtest')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('1a623022f932925b7dc3e557c14cc81c5edc0631ca92cc94b5f80968c5ad38003880282129b71a99e4ee56d7204db71a156f5af12d79021cfad4417c2f80cc4b')

build()
{
  cmake -H$pkgname-$pkgver -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -Dgtest_build_tests=ON \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

check()
{
  ctest --test-dir build -E "googletest-port-test"
}

package()
{
  DESTDIR="${pkgdir}" cmake --build build --target install

  # Shouldn't be present
  find "${pkgdir}" -name '*.pump' -print -delete

  cd $pkgname-$pkgver
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CONTRIBUTORS -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd googletest
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/googletest/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/googletest/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/googletest"

  cd ../googlemock
  install -Dm 644 cmake/* -t "${pkgdir}/usr/src/gmock/cmake"
  install -Dm 644 src/* -t "${pkgdir}/usr/src/gmock/src"
  install -Dm 644 CMakeLists.txt -t "${pkgdir}/usr/src/gmock"

  sed -i 's|src/||' "${pkgdir}/usr/src/gmock/src/gmock-all.cc"

  python -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
  python -O -m compileall -d /usr/share/gmock "${pkgdir}/usr/share/gmock"
}
