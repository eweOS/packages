# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdvdread
pkgver=6.1.3
pkgrel=1
pkgdesc='Library for reading DVD video disks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.videolan.org/developers/libdvdnav.html'
license=(GPL-2.0-or-later)
makedepends=(git)
optdepends=('libdvdcss: Decoding encrypted DVDs')
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver")
sha256sums=('d2afa0a0f50b128daf99112c3caf9be9067e24ff6b3d4479e9d531ffcf3e2855')

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
