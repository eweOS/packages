# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnewt
pkgver=0.52.24
pkgrel=1
pkgdesc="Not Erik's Windowing Toolkit - text mode windowing with slang"
arch=(x86_64 aarch64 riscv64)
url='https://pagure.io/newt'
license=(GPL)
depends=(popt slang)
makedepends=(python "tcl")
optdepends=('python: libnewt support with the _snack module'
            'tcl: whiptcl support')
options=(!makeflags)
source=("https://releases.pagure.org/newt/newt-$pkgver.tar.gz")
sha256sums=('5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb')

prepare() {
  cd newt-$pkgver
  echo '#define USE_INTERP_RESULT 1' >> config.h
  export _tclver=$(cat /usr/lib/pkgconfig/tcl.pc | grep "^libfile=libtcl" | sed 's/^libfile=libtcl//; s/.so$//')
  sed -i "s:tcl8.4:tcl$_tclver:" Makefile.in
}

build() {
  cd newt-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make -C newt-$pkgver prefix="$pkgdir/usr" install
}

