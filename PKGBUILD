# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libunistring
pkgver=1.5
pkgrel=1
pkgdesc='Library for manipulating Unicode strings and C strings'
url='https://www.gnu.org/software/libunistring/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(musl)
provides=('libunistring.so')
source=(https://ftp.gnu.org/gnu/$pkgname/${pkgname}-${pkgver}.tar.xz)
sha512sums=('cbf6a1ddb8dbdd922d7650c110adef285133c303e69e943fbe240bc988954912f0fc7fbd205feacb3f6b98bda53df07ee2ad4e9ec241b8e78d0c52083a9f5c32')

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
