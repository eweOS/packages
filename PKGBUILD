# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnewt
pkgver=0.52.25
pkgrel=1
pkgdesc="Not Erik's Windowing Toolkit - text mode windowing with slang"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://pagure.io/newt'
license=(GPL)
depends=(popt slang)
makedepends=(python "tcl")
optdepends=('python: libnewt support with the _snack module'
            'tcl: whiptcl support')
options=(!makeflags)
source=("https://releases.pagure.org/newt/newt-$pkgver.tar.gz")
sha256sums=('ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82')

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

