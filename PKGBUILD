# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nasm
pkgver=2.15.05
pkgrel=1
pkgdesc='80x86 assembler designed for portability and modularity'
url='https://www.nasm.us'
arch=('x86_64')
license=('BSD')
depends=('glibc')
checkdepends=('perl')
source=(https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/nasm
}

# vim: ts=2 sw=2 et:
