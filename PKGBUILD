# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=potrace
pkgver=1.16
pkgrel=2
pkgdesc='Utility for tracing a bitmap (input: PBM,PGM,PPM,BMP; output: EPS,PS,PDF,SVG,DXF,PGM,Gimppath,XFig)'
url='http://potrace.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(zlib)
makedepends=(autoconf)
source=("http://potrace.sourceforge.net/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('be8248a17dedd6ccbaab2fcc45835bb0502d062e40fbded3bc56028ce5eb7acc')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --with-libpotrace

  if [ "$CARCH" != "x86_64" ]; then
     # disable i386 features
     sed -i '/HAVE_I386/d' config.h
  fi 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
