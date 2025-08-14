# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=2.2.4
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5218fcd3ad285687ed3f78b4651d7d3aee92b6f28e6c563a884975e654a43c94c4e5c02c5ed0322c3d3627d83d4843df2d2d8441f09aa18d00674ca9fd657345')

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
