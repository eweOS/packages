# Maintainer: Yukari Chiba <i@0x7f.cc>

### jbig2dec new releases require a rebuild for the following packages: ghostscript, mupdf, python-pymupdf, zathura-pdf-mupdf ###

pkgname=jbig2dec
pkgver=0.20
pkgrel=1
pkgdesc='Decoder implementation of the JBIG2 image compression format'
url='https://jbig2dec.com/'
arch=(x86_64 aarch64 riscv64)
license=('GPL3')
depends=('libpng')
makedepends=('git')
source=("git+https://github.com/ArtifexSoftware/jbig2dec.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname} #-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname} #-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname} #-${pkgver}
  make DESTDIR="${pkgdir}" install
}
