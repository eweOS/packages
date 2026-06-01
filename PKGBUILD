# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=cmocka
epoch=2
pkgver=2.0.2
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0')
depends=('musl')
makedepends=('cmake' 'git')
source=(https://cmocka.org/files/2.0/cmocka-${pkgver}.tar.xz)
sha512sums=('d02d65f0881f18f30b9e46c325acfa349261339daa2c1bf3a4e6360976f13b31588e997415197220f6def156f77d9864994d4e3cfd09c8f16a8594d0a4789a16')

prepare()
{
  cd $pkgname-$pkgver
  mkdir build
}

build()
{
  cd $pkgname-$pkgver/build
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
  cd $pkgname-$pkgver/build
  make test
}

package()
{
  cd $pkgname-$pkgver/build
  make install DESTDIR="$pkgdir"
}
