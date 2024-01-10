# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=musl-rpmatch
pkgver=1.0
pkgrel=1
pkgdesc="Standalone library to implement GNU libc's rpmatch"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/pullmoll/musl-rpmatch"
license=('LGPL')
depends=('musl')
makedepends=('automake' 'autoconf' 'libtool')
source=("${pkgname}-${pkgver}"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9d8fc3be66f23b57793eccf62998d1c0ff8df24d8781d37ee99faf618cdceeda778132df2c75ace2ecd8aa6392bcdf15eaa9ce0acd657401af049ccf61fd5b14')

prepare()
{
  cd ${pkgname}-${pkgver}
  ./bootstrap.sh
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  install -Dm0644 musl-rpmatch.pc $pkgdir/usr/lib/pkgconfig/musl-rpmatch.pc
}

