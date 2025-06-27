# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdmtx
pkgver=0.7.8
pkgrel=1
pkgdesc='A software for reading and writing Data Matrix 2D barcodes'
url='https://libdmtx.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LicenseRef-libdmtx)
makedepends=(git)
source=(git+https://github.com/dmtx/libdmtx#tag=v$pkgver)
sha256sums=('0ad1fcf472cc785fb0f5ecb055a2568384fcb85a09175cb176b24bf76adaaa48')

prepare() {
  cd $pkgname
  autoreconf -vi
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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
