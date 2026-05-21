# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=2.2.6
pkgrel=2
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9e636b659fd9260a35b0521550943fbbd2f2712cb1d9c79a702e4edca1435e0ef9938c0afb7d8792a0eb1ac66eb4a0f641b8de6fa8cbea43a9fa1bd4ebfeaef0')

build()
{
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMI_BUILD_STATIC=OFF \
    -DMI_BUILD_OBJECT=OFF \
    -DMI_INSTALL_TOPLEVEL=ON \
    -DMI_NO_OPT_ARCH=ON
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
