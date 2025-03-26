# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xz
pkgver=5.8.0
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later' 'GPL-3.0-or-later' 'LGPL-2.1-or-later' '0BSD')
provides=('liblzma.so')
source=("https://tukaani.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b523c5e47d1490338c5121bdf2a6ecca2bcf0dce05a83ad40a830029cbe6679b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/xz/"
  ln -sf /usr/share/doc/xz/COPYING "${pkgdir}/usr/share/licenses/xz/"
  ln -sf /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/doc/xz/COPYING.GPLv2"
}
