# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Gour <Gour <gour@mail.inet.hr>

pkgname=libisoburn
pkgver=1.5.4 #.pl01
pkgrel=2
pkgdesc="frontend for libraries libburn and libisofs"
url="https://dev.lovelyhq.com/libburnia"
arch=(x86_64 aarch64)
license=('GPL2')
depends=('libburn' 'libisofs' 'readline')
optdepends=('tk: xorriso-tcltk frontend'
  'sudo: use with xorriso-dd-target')
provides=('xorriso' 'xorriso-tcltk')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2d89846d43880f17fa591c53b3bea42ffb803628e4e630c680fc2c9184f79132')

build()
{
  cd "${pkgname}"-${pkgver/.pl01/}
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${pkgname}"-${pkgver/.pl01/}
  make DESTDIR="${pkgdir}" install
}
