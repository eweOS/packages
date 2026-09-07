# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=2.42.0
pkgrel=2
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
  "0001-backport-fix-sym.patch"
  "0002-ir-files-cmdline-order.patch::https://github.com/rui314/mold/commit/92eb17a07c60a88b3a1a8c9cef014ac84eaf0cf9.patch"
)
sha256sums=('6c0f3308c5b3159a369202d970922ad819bab1bfcb5a3b3c06a723d19f65373e'
            'dae7b7d04bc25dfc0e1581afb24f006213ec86d3381a7c562106b02da495e3f0'
            '92b7500cfaecb2a69cc9903059d8da8be01e90fab91f1e99db6a42707a8a2984')

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
