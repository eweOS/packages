# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.40.3
pkgrel=1
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'cmake' 'tbb')
makedepends=('python' 'linux-headers')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('308c10f480d355b9f9ef8bb414dfb5f4842bee87eb96b6a7666942f4036a0223')

build()
{
  export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"

  if check_option lto y; then
    _MOLD_LTO=ON
  else
    _MOLD_LTO=OFF
  fi

  cmake \
    -S "$pkgname-$pkgver" \
    -B build \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D CMAKE_INSTALL_LIBEXECDIR='lib' \
    -D CMAKE_INSTALL_LIBDIR='lib' \
    -D MOLD_USE_SYSTEM_MIMALLOC=ON \
    -D MOLD_USE_SYSTEM_TBB=ON \
    -D MOLD_USE_MIMALLOC=ON \
    -D MOLD_USE_MOLD=ON \
    -D MOLD_LTO=${_MOLD_LTO}
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  ln -s mold "${pkgdir}/usr/bin/ld"
}
