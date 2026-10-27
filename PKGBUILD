# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mimalloc
pkgver=3.6.0
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/microsoft/mimalloc"
license=('MIT')
makedepends=('cmake')
# 0001: Backport, support LLVM libunwind in the profiling backtrace fallback
# https://github.com/microsoft/mimalloc/commit/a08162677e6a0901d7296f82ace4daafec802d24
# 0002: Backport, prevent pprof test call sites from being inlined
# https://github.com/microsoft/mimalloc/commit/072f5d12fd4c75d7d9081106f78441f513fc1378
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "0001-use-unwind-h-instead-of-libunwind.patch"
  "0002-pprof-test-noinline-sites.patch"
)
sha512sums=('8a8013ee856fa57e9620929542ffd24c114439365a4d06a41a25fad7aed27a77c5a0e2104fde3d2f67990190644de88d6b7fed964a574d6913977ff5edbe4839'
            'b4a53618c2375e495029701202b440a79463ab590c4f3670037401c9f26a10076b8cc81a506a5c4beba6dc2c18b56fc05d239b5c067a9234fa800929bcf97b0d'
            '5a599f99e1b02d94beabfb814425566222245f616fa10b9ac219490fe927e91e6e48af82d070ea46945bc904c6ae15d4d7f2f456870cd21a1899ae7bbd51f924')

prepare()
{
  _patch_ "$pkgname-$pkgver"
}

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
