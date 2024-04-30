# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=nasm
pkgver=2.16.03
pkgrel=1
pkgdesc='80x86 assembler designed for portability and modularity'
url='https://www.nasm.us'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('musl')
checkdepends=('perl')
source=(https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('0c706e41a9c33e1ac3bad5056e8bf8cbcd51785b551a6e34ce7d0d723df8eaab8603a033e89b3dcda1004b558f9e9ef3196691500f10d8201bf47a323a516f84')

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
