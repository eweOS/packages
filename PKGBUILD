# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cmocka
pkgver=1.1.7
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64 aarch64 riscv64)
license=('Apache')
depends=('musl')
makedepends=('cmake')
source=("https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz")
sha512sums=('fe451893474dce1270e12af707a9a8fe1f0217e1782b4e1a67d25dadf56ff4a5e7dbc9ba4431f774aedffa46a40a28a6a0488df24feefb2f93e90fd2369c2c88')

prepare()
{
  cd ${pkgname}-${pkgver}
  mkdir build
}

build()
{
  cd ${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DUNIT_TESTING=ON
  make
}

check()
{
  cd ${pkgname}-${pkgver}/build
  make test
}

package()
{
  cd ${pkgname}-${pkgver}/build
  make install DESTDIR="${pkgdir}"
}
