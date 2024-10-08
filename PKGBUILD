# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libwmf
pkgver=0.2.13
pkgrel=1
pkgdesc="A library for reading vector images in Microsoft's native Windows Metafile Format (WMF)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/caolanm/libwmf"
license=('LGPL-2.1-or-later')
depends=('expat' 'freetype2' 'libjpeg' 'libpng' 'zlib')
makedepends=('gdk-pixbuf2')
optdepends=('gdk-pixbuf2: for pixbuf loader')
source=($pkgname-$pkgver.tar.gz::https://github.com/caolanm/libwmf/archive/v$pkgver.tar.gz)
sha256sums=('18ba69febd2f515d98a2352de284a8051896062ac9728d2ead07bc39ea75a068')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i '1i #include<limits.h>' src/extra/gd/gd.c
  sed -i '1i #include<limits.h>' src/extra/gd/gd_gd2.c
  autoreconf -fi
} 

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-gsfontmap=/usr/share/ghostscript/Resource/Init/Fontmap.GS \
              --with-gsfontdir=/usr/share/fonts/gsfonts
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
