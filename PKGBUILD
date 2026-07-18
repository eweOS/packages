# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=nasm
pkgver=3.02
pkgrel=1
pkgdesc='80x86 assembler designed for portability and modularity'
url='https://www.nasm.us'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
depends=('musl' 'zlib-ng')
checkdepends=('perl')
source=(https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('dc80d8a9a582423e62703da3cc3f37ee57735939b975faa8a72d061a8b596f763d206c7cc3e48c32d2ad726f38e430dc3b85cffd0c3b32e71e20ad9cc24f4804')

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
