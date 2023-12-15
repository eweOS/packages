# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cmocka
epoch=2
pkgver=1.1.5.r203.g109645a
pkgrel=2
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64 aarch64 riscv64)
license=('Apache')
depends=('musl')
makedepends=('cmake')
source=("git+https://gitlab.com/cmocka/cmocka.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^cmocka-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd ${pkgname}
  mkdir build
}

build()
{
  cd ${pkgname}/build
  # no examples: failed with lto: https://gitlab.com/cmocka/cmocka/-/issues/14
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DUNIT_TESTING=ON \
    -DWITH_EXAMPLES=OFF
  make
}

check()
{
  cd ${pkgname}/build
  make test
}

package()
{
  cd ${pkgname}/build
  make install DESTDIR="${pkgdir}"
}
