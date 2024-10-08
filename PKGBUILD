# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libspiro
pkgver=20240903
pkgrel=1
pkgdesc='Library that simplifies the drawing of beautiful curves'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/fontforge/libspiro'
license=(GPL-3.0-or-later)
makedepends=(git)
source=("git+https://github.com/fontforge/libspiro.git#tag=$pkgver")
sha256sums=('566551119f6374476c20dae89ebf8e5fef0f76114527bb4fa68586c7274cd833')

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
