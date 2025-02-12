# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libtasn1
pkgver=4.20.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later' 'GFDL-1.3-or-later')
url="https://www.gnu.org/software/libtasn1/"
source=("https://ftp.gnu.org/gnu/libtasn1/${pkgname}-${pkgver}.tar.gz")
sha256sums=('92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c')

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
  _install_license_ COPYING
}
