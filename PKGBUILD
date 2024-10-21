# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=clisp
pkgver=2.49.93
pkgrel=2
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
url="https://clisp.sourceforge.io/"
depends=('readline' 'libsigsegv' 'libxcrypt' 'libunistring')
provides=('common-lisp')
makedepends=('git')
options=('!makeflags' '!emptydirs')
_commit=c735dd548ba2365804bcee9c2bdd3c291657e8ae
source=("git+https://gitlab.com/gnu-clisp/clisp#commit=$_commit")
sha256sums=('e1845c268f8cc94fdb4c54d2792994d4fae715490319fc10cb2707590080346c')

build() {
  cd $pkgname
  CFLAGS+=" -ffat-lto-objects" \
  ./configure --prefix=/usr --with-readline --without-ffcall src

  cd src
  ./makemake --prefix=/usr --with-readline --without-ffcall > Makefile
  make
}

check() {
  cd $pkgname
  make check || :
}

package() {
  cd $pkgname/src
  make DESTDIR="$pkgdir" install
}
