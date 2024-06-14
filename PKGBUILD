# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.32.0
pkgrel=2
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'cmake')
makedepends=('python' 'linux-headers')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Mark-file-statisfying-symbols-in-crtbegin.o-alive.patch")
sha256sums=('4b7e4146ea0f52be9adae8b417399f3676a041e65b55e3f25f088120d30a320b'
            '3d260bd56ffa1bedf803c513399553305ecf22046097a6471bfbfd8b2cc86ef4')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

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
