# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc.archlinux.org>
# Contributor: Eric Johnson <eric.archlinux.org>

pkgname=libidn
pkgver=1.43
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications"
url="https://www.gnu.org/software/libidn/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL3' 'LGPL')
depends=('musl')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164')

build()
{
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr
  make
}

check()
{
  cd "${pkgname}-${pkgver}"

  make check
}

package()
{
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  # doc html installation - gtk-doc isn't supported anymore - FS#55151
  mkdir -p "${pkgdir}/usr/share/gtk-doc/html/${pkgname}"
  cp -r -v doc/reference/html/* "${pkgdir}/usr/share/gtk-doc/html/${pkgname}"
}
