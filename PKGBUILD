# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=3.6.1
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha512sums=('03090fbcfe16aff6b640ef64f8d26551f0347c9e49fbca4efc48d6874ec87c109227fa05157e21e2031d58fe9374a8af9a5e34cf67a2255806f32e39ce4ca3ed')

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
