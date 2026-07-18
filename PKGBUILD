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
# backport: 0001-drop-cast-to-bool-hack.patch
# https://github.com/netwide-assembler/nasm/commit/44e89ba9b650b5e1533bca43682e167f51a3511f
source=(
  https://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/${pkgname}-${pkgver}.tar.xz
  0001-drop-cast-to-bool-hack.patch
)
sha512sums=('dc80d8a9a582423e62703da3cc3f37ee57735939b975faa8a72d061a8b596f763d206c7cc3e48c32d2ad726f38e430dc3b85cffd0c3b32e71e20ad9cc24f4804'
            '4f21b7a1514ac36f7b04891897414a550c8f8466932cd5b6b5503d36d4e54b4dc3a6b683622fc6b7fe6e6c56f2b46570be6c82a699deab69476d25f9d2a31bb4')

prepare()
{
  _patch_ ${pkgname}-${pkgver}
}

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
