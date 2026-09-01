# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libksba
pkgver=1.8.1
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('bash' 'libgpg-error' 'musl')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5')

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
