# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcdio-paranoia
pkgver=10.2+2.0.2
pkgrel=1
pkgdesc='Compact Disc Digital Audio (CDDA) extraction tool using libcdio for CDROM access'
arch=(x86_64 aarch64 riscv64)
url='https://www.gnu.org/software/libcdio/'
license=(GPL-3.0-or-later)
depends=(libcdio)
makedepends=(git)
source=("git+https://github.com/rocky/libcdio-paranoia.git#tag=release-$pkgver")
sha256sums=('4d9e3677929d031a815ac2c2303c66cf7e31615c1e739214808436f842bc216f')

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
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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

