# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=brotli
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.1.0
pkgrel=0
pkgdesc='Generic-purpose lossless compression algorithm'
url='https://github.com/google/brotli'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
makedepends=('musl' 'llvm-libs' 'cmake')
source=("https://github.com/google/brotli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff')


build()
{
  cd ${pkgname}-${pkgver}
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=True
  make -C build VERBOSE=1
}

package()
{
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="$pkgdir" install
}
