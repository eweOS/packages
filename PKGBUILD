# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=libtasn1
pkgver=4.19.0
pkgrel=2
pkgdesc="The ASN.1 library used in GNUTLS"
arch=(x86_64 aarch64 riscv64)
license=('GPL3' 'LGPL')
url="https://www.gnu.org/software/libtasn1/"
source=("https://ftp.gnu.org/gnu/libtasn1/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  CODE_COVERAGE_LDFLAGS=${LDFLAGS} make
}

check()
{
  cd ${pkgname}-${pkgver}
  make check
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  #make -C doc/reference DESTDIR="${pkgdir}" install-data-local
}
