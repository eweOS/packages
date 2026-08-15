# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=googletest
pkgver=1.18.0
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
sha512sums=('ba0f5769ccf34acf1bc72d1f7e9ffb8202176d02b64f6f3d9047accfc0cf9026ff5a653d24935e2705fff8709566676452616c93ca0ca6277f1e21d79b58a10a')

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
