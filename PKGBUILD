# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprwire
pkgver=0.3.1
pkgrel=3
pkgdesc='A fast and consistent wire protocol for IPC'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(llvm-libs
         musl
         hyprutils
         libffi
         pugixml)
makedepends=(cmake)
provides=(libhyprwire.so)
_archive="$pkgname-$pkgver"
# Fix: tests missing <unistd.h> header for read(), write(), pipe(), fork(), close()
source=(
  "$url/archive/v$pkgver/$_archive.tar.gz"
  "0001-fix-tests-missing-unistd.patch"
)
sha256sums=('92a673d40ae6a7d66fbcd0a34ec071e026e17eaeeb0040c3375e4b2a80dba737'
            '71b35b92a5f3148283b07b9136642a619297f0da6fa60e317ffa52c7bba70025')

prepare() {
  cd "$_archive"
  patch -p1 -i "$srcdir/0001-fix-tests-missing-unistd.patch"
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake -B build -S "$_archive" -W no-dev ${cmake_options[@]}
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive"/LICENSE
}

