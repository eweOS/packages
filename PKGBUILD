# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libisoburn
pkgver=1.5.8
_pkgver=${pkgver/.pl01/}
pkgrel=1
pkgdesc="frontend for libraries libburn and libisofs"
url="https://dev.lovelyhq.com/libburnia"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
depends=('libburn' 'libisofs' 'readline')
optdepends=('tk: xorriso-tcltk frontend'
  'sudo: use with xorriso-dd-target')
provides=('xorriso' 'xorriso-tcltk')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('dbb36620ceb8e959c88bf29994e2220ed501cc68cb9eea7d51f94881bc8c548e')

prepare()
{
  cd "${pkgname}"-${_pkgver}
  autoreconf -fiv
}

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
