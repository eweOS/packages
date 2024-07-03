# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libksba
pkgver=1.6.7
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=(x86_64 aarch64 riscv64)
depends=('bash' 'libgpg-error' 'musl')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763')

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
