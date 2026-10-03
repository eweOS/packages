# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libutf8proc
pkgver=2.12.0
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/JuliaStrings/utf8proc'
license=(MIT Unicode-3.0)
makedepends=(cmake git ninja)
provides=(libutf8proc.so)
source=("git+$url#tag=v$pkgver")
sha256sums=('fcf2ba77881774208b17f57a0cbc8e6a70d07dcb51ec31bbf35c32ce58331e40')

build() {
  cmake -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -G Ninja \
    -S utf8proc
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  _install_license_ utf8proc/LICENSE.md
}
