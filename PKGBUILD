# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spatialindex
pkgver=2.1.0
pkgrel=1
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://libspatialindex.github.io/"
license=(MIT)
makedepends=(git cmake)
source=("git+https://github.com/libspatialindex/libspatialindex#tag=$pkgver")
sha256sums=('923fd741f770b2f07fd844fb540e7e5df0c2977b9d61530b5b69db1a8bb36d5a')

build() {
  mkdir build && cd build
  cmake ../libspatialindex \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/libspatialindex/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
