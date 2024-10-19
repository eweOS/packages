# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>

pkgname=help2man
pkgver=1.49.3
pkgrel=2
pkgdesc="Conversion tool to create man files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/help2man/"
license=('GPL')
depends=('perl-locale-gettext')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('5f19fad1e38b0572b63ed8bfd146b717fc22dff3a26641e8b5c8431df13da9574679d9a3407da62790db8a29286694ea1bfd751cba168f475302ad31cce845cf')

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
