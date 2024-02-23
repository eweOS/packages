# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnghttp2
pkgver=1.59.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://nghttp2.org/'
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/nghttp2/nghttp2.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  autoreconf -i
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname/lib

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2/COPYING"
}
