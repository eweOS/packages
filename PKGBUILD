# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wasi-libc
pkgver=0+465+d181bdd4
_commit=d181bdd429f0067c92d817909b01e4970ad7d70a # tags/wasi-sdk-28
pkgrel=1
pkgdesc='WASI libc implementation for WebAssembly'
arch=('any')
url='https://github.com/WebAssembly/wasi-libc'
license=('Apache-2.0 WITH LLVM-exception AND Apache-2.0 AND MIT')
makedepends=('git' 'llvm' 'clang')
source=("git+https://github.com/WebAssembly/wasi-libc.git#commit=${_commit}")
sha256sums=('0ea4092e95b4f2c7de78368ad19b28cfca3f75beceeb73f650466189c3d888d6')
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
  )
  local -A targets=(
    wasm32-wasi           ''
    wasm32-wasip1         ''
    wasm32-wasip1-threads 'THREAD_MODEL=posix'
    wasm32-wasip2         'WASI_SNAPSHOT=p2'
  )

  cd ${pkgname}

  for target in "${!targets[@]}"; do
    make "${make_options[@]}" TARGET_TRIPLE="$target" ${targets[$target]}
  done
}

package()
{
  cd ${pkgname}
  install -dm755 "${pkgdir}"/usr/share
  cp -dr -p sysroot "${pkgdir}"/usr/share/wasi-sysroot
  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
