# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=3.6.0
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8a8013ee856fa57e9620929542ffd24c114439365a4d06a41a25fad7aed27a77c5a0e2104fde3d2f67990190644de88d6b7fed964a574d6913977ff5edbe4839')

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
