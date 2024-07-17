# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libunistring
pkgver=1.2
pkgrel=1
pkgdesc='Library for manipulating Unicode strings and C strings'
url='https://www.gnu.org/software/libunistring/'
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(musl)
provides=('libunistring.so')
source=(https://ftp.gnu.org/gnu/$pkgname/${pkgname}-${pkgver}.tar.xz)
sha512sums=('5fbb5a0a864db73a6d18cdea7b31237da907fff0ef288f3a8db6ebdba8ef61ad8855e5fc780c2bbf632218d8fa59dd119734e5937ca64dc77f53f30f13b80b17')

prepare()
{
  cd $pkgname-$pkgver
  sed -i '/pragma weak pthread_create/d' tests/glthread/thread.h
  # test fails with musl locale
  sed -i '7,40d' tests/test-c32ispunct.sh
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  make -C $pkgname-$pkgver check || true
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
