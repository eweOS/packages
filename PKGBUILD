# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdvdread
pkgver=7.0.0
pkgrel=1
pkgdesc='Library for reading DVD video disks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.videolan.org/developers/libdvdnav.html'
license=(GPL-2.0-or-later)
makedepends=(git)
optdepends=('libdvdcss: Decoding encrypted DVDs')
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver")
sha256sums=('cf7e11067203c93ba43089d89857abe0002626d5205504755a5049315d2f94da')

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

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
