# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nasm
pkgver=2.16.01
pkgrel=2
pkgdesc='80x86 assembler designed for portability and modularity'
url='https://www.nasm.us'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('musl')
checkdepends=('perl')
source=(https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('51fccb5639ce019d9c423c0f279750ffbd74c64cd41dd3b185d1aa1a1aaed79c5d3cd8d4bebbc13ee249a375ed27457ea2abde1a4dbb24d354598fffd1254833')

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
