# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=liblqr
pkgver=0.4.3
pkgrel=1
pkgdesc='A seam-carving C/C++ library called Liquid Rescale'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://liblqr.wikidot.com/'
license=(GPL-3.0-or-later)
depends=(glib2)
makedepends=(git autoconf)
source=(git+https://github.com/carlobaldassi/liblqr#tag=v$pkgver)
sha256sums=('1b1d26ab3138b0ec34062c3f1b8cd808d5c7a85e37fdbb9c6fd6722f52b2122d')
options=(!emptydirs)

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr 
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
