# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bison
pkgver=3.8.2
pkgrel=1
pkgdesc="The GNU general-purpose parser generator"
arch=(x86_64 aarch64 riscv64)
url='http://www.gnu.org/software/bison/'
license=('GPL3')
makedepends=(flex perl)
source=(
  "http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-$pkgver.tar.xz"
)

sha256sums=('9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --datadir=/usr/share
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
