# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=cmocka
epoch=2
pkgver=1.1.8
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache')
depends=('musl')
makedepends=('cmake' 'git')
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz)
sha512sums=('59c3d8732c5558abf4dd9aedac2d5e41cf7693c26a88932449c3dec7be7903c479515f15b4ab8876e4b03f3b4b68460ef34bc6ce079677262638c15e29da37ef')

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
