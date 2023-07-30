# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=googletest
pkgver=1.12.1
pkgrel=1
pkgdesc='C++ testing utility based on the xUnit framework'
url='https://github.com/google/googletest'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('llvm-libs' 'sh')
makedepends=('python' 'cmake' 'llvm-libs' 'sh')
optdepends=('python: gmock generator')
provides=('gmock' 'gtest')
_srcname=googletest-release-${pkgver}
source=(${_srcname}.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz)
sha512sums=('a9104dc6c53747e36e7dd7bb93dfce51a558bd31b487a9ef08def095518e1296da140e0db263e0644d9055dbd903c0cb69380cb2322941dbfb04780ef247df9c')

build()
{
  cmake -H${_srcname} -Bbuild \
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

  cd ${_srcname}
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
