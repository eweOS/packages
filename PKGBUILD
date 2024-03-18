# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libksba
pkgver=1.6.6
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=(x86_64 aarch64 riscv64)
depends=('bash' 'libgpg-error' 'musl')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
