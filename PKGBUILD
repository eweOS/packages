# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dvisvgm
pkgver=3.4.3
pkgrel=1
pkgdesc='A fast DVI, EPS, and PDF to SVG converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://dvisvgm.de/'
license=(GPL-3.0-or-later)
depends=(brotli
         freetype2
         ghostscript
         potrace
         texlive-bin
         woff2
         zlib)
optdepends=('mupdf-tools: to process PDF files')
checkdepends=(python-lxml)
makedepends=(autoconf-archive
             git
             python)
source=(git+https://github.com/mgieseki/dvisvgm#tag=$pkgver)
sha256sums=('433ac290fe866fe4b0d2f4b61d8cb11caf382120a1c1c3ca3a92b17b36855997')

prepare() {
  cd $pkgname
  autoreconf -vi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
