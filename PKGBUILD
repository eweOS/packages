# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dvisvgm
pkgver=3.4.4
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
sha256sums=('d7568e7160186a370f25927506531ae721f5ba5a0309728ce7317c9c53e4c1e7')

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
