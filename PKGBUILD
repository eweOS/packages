# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.42.0
pkgrel=1
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'tbb')
makedepends=('cmake' 'python' 'linux-headers')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c0f3308c5b3159a369202d970922ad819bab1bfcb5a3b3c06a723d19f65373e')

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
  install -d "${pkgdir}/usr/share/licenses"
  mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/usr/share/doc"
}
