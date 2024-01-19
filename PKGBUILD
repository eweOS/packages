# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libksba
pkgver=1.6.5
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=(x86_64 aarch64 riscv64)
depends=('bash' 'libgpg-error' 'musl')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16')

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
