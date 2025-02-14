# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=googletest
pkgver=1.16.0
pkgrel=1
pkgdesc='C++ testing utility based on the xUnit framework'
url='https://github.com/google/googletest'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
depends=('llvm-libs' 'sh')
makedepends=('python' 'cmake' 'llvm-libs' 'sh')
optdepends=('python: gmock generator')
provides=('gmock' 'gtest')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('bec8dad2a5abbea8e9e5f0ceedd8c9dbdb8939e9f74785476b0948f21f5db5901018157e78387e106c6717326558d6642fc0e39379c62af57bf1205a9df8a18b')

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
