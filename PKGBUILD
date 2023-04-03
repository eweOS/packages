# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nasm
pkgver=2.15.05
pkgrel=1
pkgdesc='80x86 assembler designed for portability and modularity'
url='https://www.nasm.us'
arch=(x86_64 aarch64)
license=('BSD')
depends=('glibc')
checkdepends=('perl')
source=(https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('512f90a2584f1c5811429274b97c64a2cedf37b9fdeffb1bcd0ea64afd9ecc19a2d7877ca8f1e05393aa324153fc9f39ea51dacbf8d25a7d5a2d7728c925dba7')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  make test
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/nasm
}

# vim: ts=2 sw=2 et:
