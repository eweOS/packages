# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=nasm
pkgver=3.01
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
sha512sums=('ca9550ad3239cfaa9546a908e8de86e11a7c7dd9d6006f42d272d0b025b601cdb205e60b8b3929f31123ef450dd0f0403e1300328cadf0ffdfd459f443944482'
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
