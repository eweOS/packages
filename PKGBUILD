# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.35.0
pkgrel=1
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'cmake' 'tbb')
makedepends=('python' 'linux-headers')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2703f1c88c588523815886478950bcae1ef02190dc4787e0d120a293b1a46e3b')

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
    -D MOLD_USE_MIMALLOC=0 \
    -D MOLD_USE_MOLD=ON \
    -D MOLD_LTO=${_MOLD_LTO}
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  ln -s mold "${pkgdir}/usr/bin/ld"
}
