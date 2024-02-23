# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xmlto
pkgver=0.0.28
pkgrel=1
pkgdesc="Convert xml to many other formats"
arch=(x86_64 aarch64 riscv64)
url="https://pagure.io/xmlto/"
license=('GPL')
depends=('libxslt')
makedepends=('docbook-xsl')
source=("https://releases.pagure.org/xmlto/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1130df3a7957eb9f6f0d29e4aa1c75732a7dfb6d639be013859b5c7ec5421276')

prepare() {
  cd $pkgname-$pkgver
  # fix -Wimplicit-int
  sed -i 's/static ifsense;/static int ifsense;/; s/main(int/int main(int/; s/yylex();/return yylex();/' xmlif/xmlif.l
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure BASH=/bin/bash \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
