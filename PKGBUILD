# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=convertlit
pkgver=1.8
pkgrel=2
pkgdesc='An extractor/converter for .LIT eBooks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.convertlit.com/'
license=(GPL-2.0-or-later)
depends=(libtommath)
makedepends=('dos2unix')
source=(http://www.convertlit.com/clit18src.zip
        Wformat-security.patch)
sha256sums=('d70a85f5b945104340d56f48ec17bcf544e3bb3c35b1b3d58d230be699e557ba'
            '9d675e335329814e97f3c677bd9d7ebd3b405400c446ed490329314ab01741c9')

prepare() {
# source code is ending with CRLF, convert patch from LF to CRLF
  unix2dos -n Wformat-security.patch Wformat-security-crlf.patch
# Fix build with -Wformat-security (Gentoo)
  patch -p1 --binary < Wformat-security-crlf.patch
# Link to shared libtommath and use system LDFLAGS
  sed -e 's|../libtommath-0.30/libtommath.a|/usr/lib/libtommath.so ${LDFLAGS}|' -i clit18/Makefile
# Use system CFLAGS
  sed -e 's|CFLAGS=-O3 -Wall|CFLAGS+=|' -i lib/Makefile
  sed -e 's|CFLAGS=-funsigned-char -Wall -O2|CFLAGS+=|' -i clit18/Makefile
  
  sed -i 's/gcc/clang/g' clit18/Makefile
}

build() {
  export CFLAGS+=" -Wno-implicit-function-declaration"

  cd lib && make
  cd ../clit18 && make
}

package() {
  cd clit18
  install -Dm755 clit -t "$pkgdir"/usr/bin
}
