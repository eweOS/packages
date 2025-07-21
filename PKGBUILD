# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=djvulibre
pkgver=3.5.29
pkgrel=1
pkgdesc='Library and utilities to create, manipulate and view DjVu (déjà vu) documents'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://djvu.sourceforge.net/'
license=(GPL-2.0-or-later)
depends=(
  bash
  hicolor-icon-theme
  libjpeg-turbo
  libtiff
)
makedepends=(git autoconf)
source=("$pkgname::git+https://git.code.sf.net/p/djvu/djvulibre-git#tag=release.$pkgver")
sha256sums=('43366ee78f5fa696a3ef5b1283fe329d807d9cbf1ee04faed0258d150f0a3864')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
