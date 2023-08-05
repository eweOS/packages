# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wasi-libc
pkgver=0+328+1dfe5c30
_gittag=wasi-sdk-20
pkgrel=1
pkgdesc='WASI libc implementation for WebAssembly'
arch=('any')
url='https://github.com/WebAssembly/wasi-libc'
license=('Apache' 'MIT')
makedepends=('git' 'llvm' 'clang')
source=("git+https://github.com/WebAssembly/wasi-libc.git#tag=${_gittag}")
sha256sums=('SKIP')
options=('staticlibs')

pkgver()
{
  cd ${pkgname}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  local make_options=(
    WASM_CC=/usr/bin/clang
    CC=clang
    WASM_AR=/usr/bin/llvm-ar
    AR=ar
    WASM_NM=/usr/bin/llvm-nm
    NM=nm
    # Remove bulk memory support
    # https://bugzilla.mozilla.org/show_bug.cgi?id=1773200#c4
    BULK_MEMORY_SOURCES=
  )

  cd ${pkgname}
  make "${make_options[@]}"
}

package()
{
  cd ${pkgname}
  install -dm755 "${pkgdir}"/usr/share
  cp -dr -p sysroot "${pkgdir}"/usr/share/wasi-sysroot
}
