# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libksba
pkgver=1.9.1
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('bash' 'libgpg-error' 'musl')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b')

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
