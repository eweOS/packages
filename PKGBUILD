# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cmocka
pkgver=1.1.5
pkgrel=2
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=('x86_64')
license=('Apache')
depends=('musl')
makedepends=('cmake')
source=("https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz")
sha512sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir build
}

build() {
  cd ${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DUNIT_TESTING=ON
  make
}

check() {
  cd ${pkgname}-${pkgver}/build
  make test
}

package() {
  cd ${pkgname}-${pkgver}/build
  make install DESTDIR="${pkgdir}"
}
