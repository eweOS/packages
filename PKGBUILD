# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=2.0.9
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bf6945bfb600ade35dab34c7f570ee4f69a77612547ad874bbbd989a4e594a6a219c222a22c90c5e36f205aae4d5cd1a5e4651caed5433db275d414c6769bf49')

build()
{
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

package()
{
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
