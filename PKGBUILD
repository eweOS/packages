# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.42.1
pkgrel=1
pkgdesc='A Modern Linker'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/rui314/mold'
license=('MIT')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'tbb')
makedepends=('cmake' 'python' 'linux-headers')
# 0001: backport: fix https://github.com/rui314/mold/issues/1651
# 0002: backport: claim IR files for LTO in the command line order
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('0580221bfdad7148ceeafd0ad3c1c7b3ca9e66b45950405230cc3f81a205c816')

prepare()
{
  _patch_ "$pkgname-$pkgver"
}

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
