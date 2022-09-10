# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=2.0.6
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=('x86_64')
url="https://github.com/microsoft/mimalloc"
license=('MIT')
depends=('musl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMI_BUILD_STATIC=OFF \
    -DMI_BUILD_OBJECT=OFF \
    -DMI_INSTALL_TOPLEVEL=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
