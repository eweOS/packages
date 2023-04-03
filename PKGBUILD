# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>

pkgname=help2man
pkgver=1.49.2
pkgrel=1
pkgdesc="Conversion tool to create man files"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/help2man/"
license=('GPL')
depends=('perl-locale-gettext')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('cb8f9f923263d7160a27a7924ae559aba93d7258167888eb9e0e3e97a2014297b8d739b2bb7869acbf586354d099bd91d85f8208b901bce5ba0c5ad4b6abd6d5')

build()
{
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --libdir=/usr/lib
  make
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
