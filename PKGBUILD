# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=clisp
pkgver=2.49.93
pkgrel=1
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL')
url="https://clisp.sourceforge.io/"
depends=('readline' 'libsigsegv' 'libxcrypt' 'libunistring')
provides=('common-lisp')
makedepends=('mercurial')
options=('!emptydirs')
_rev=b55b8196c9f25428304ec3de87383319fd1f2264
source=(hg+http://hg.code.sf.net/p/clisp/clisp#revision=$_rev)
sha256sums=('SKIP')

build() {
  cd $pkgname
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
