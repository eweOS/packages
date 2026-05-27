# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=djvulibre
pkgver=3.5.30
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
  llvm-libs
  musl
)
makedepends=(git)
source=("$pkgname::git+https://git.code.sf.net/p/djvu/djvulibre-git#tag=release.$pkgver")
sha256sums=('c21998e8c805048a57bbf71cf897486457964f216aca1c07f82d09f65c2b6221')

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
