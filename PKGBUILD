# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc.archlinux.org>
# Contributor: Eric Johnson <eric.archlinux.org>

pkgname=libidn
pkgver=1.41
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications"
url="https://www.gnu.org/software/libidn/"
arch=(x86_64 aarch64)
license=('GPL3' 'LGPL')
depends=('musl')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945')

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
