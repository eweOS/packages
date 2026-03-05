# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libgpg-error
pkgver=1.59
pkgrel=1
pkgdesc="Support library for libgcrypt"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnupg.org"
license=('LGPL')
depends=('musl' 'sh')
source=(https://www.gnupg.org/ftp/gcrypt/libgpg-error/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('6570ddb77656b91c88ffd166c9fcdd79a149c898')

prepare()
{
  cd ${pkgname}-${pkgver}
  autoreconf -vfi
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  make check
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
