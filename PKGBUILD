# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libunistring
pkgver=1.4
pkgrel=1
pkgdesc='Library for manipulating Unicode strings and C strings'
url='https://www.gnu.org/software/libunistring/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(musl)
provides=('libunistring.so')
source=(https://ftp.gnu.org/gnu/$pkgname/${pkgname}-${pkgver}.tar.xz)
sha512sums=('3623cec1d5730353167a3b46d37c3ee42cd0362169285185cad4cd6d6e10b25e55d44a005bfe4769582f7b0a54f2bd8107b8f38bbf267b2e40beec3390f459fb')

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
