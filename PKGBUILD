# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.3.1
pkgrel=1
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'cmake')
makedepends=('python')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('380f540114408c37bcdb7f3bda91a056448a93124ca6992a373ae2bda35e9af7')

build()
{
  cmake \
    -S "$pkgname-$pkgver" \
    -B build \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D CMAKE_INSTALL_LIBEXECDIR='lib' \
    -D CMAKE_INSTALL_LIBDIR='lib' \
    -D MOLD_USE_SYSTEM_MIMALLOC=ON \
    -D MOLD_USE_MIMALLOC=0 \
    -D MOLD_USE_MOLD=ON
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  ln -s mold "${pkgdir}/usr/bin/ld"
}
