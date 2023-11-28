# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Gour <Gour <gour@mail.inet.hr>

pkgname=libisoburn
pkgver=1.5.6
_pkgver=${pkgver/.pl01/}
pkgrel=1
pkgdesc="frontend for libraries libburn and libisofs"
url="https://dev.lovelyhq.com/libburnia"
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
depends=('libburn' 'libisofs' 'readline')
optdepends=('tk: xorriso-tcltk frontend'
  'sudo: use with xorriso-dd-target')
provides=('xorriso' 'xorriso-tcltk')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2b80a6f73dd633a5d243facbe97a15e5c9a07644a5e1a242c219b9375a45f71b')

build()
{
  cd "${pkgname}"-${_pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${pkgname}"-${_pkgver}
  make DESTDIR="${pkgdir}" install
}
