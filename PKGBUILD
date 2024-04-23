# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rdfind
pkgver=1.6.0
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files'
arch=(x86_64 aarch64 riscv64)
url='https://rdfind.pauldreik.se'
license=('GPL-2.0-only')
depends=(nettle)
source=("${url}/${pkgname}-${pkgver}.tar.gz" disable-makefile-test-failing.patch)
sha256sums=('7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279'
            'e959af6d1e674ccd3d833235ed72480dbe3c17a18120494aaeeccf9f300f0a85')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"
}
