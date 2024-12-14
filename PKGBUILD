# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd
pkgver=14.1
pkgrel=3
pkgdesc='Engine for running Transport Tycoon Deluxe'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.openttd.org'
license=(GPL-2.0-or-later)
depends=(fluidsynth fontconfig hicolor-icon-theme)
makedepends=(cmake ninja)
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("https://cdn.$pkgname.org/$pkgname-releases/$pkgver/$pkgname-$pkgver-source.tar.xz"
	"0001-fix-compile-with-clang-19.patch"
	"0002-link-icu-components-explicitly.patch")
sha256sums=('2c14c8f01f44148c4f2c88c169a30abcdb002eb128a92b9adb76baa76b013494'
            'e98c30b4315d831751c498d19523456f3f52756527338f3d9a7184d8ce7d8ea7'
            '0dd5e0d607aa137424a07e30c7aa6dd1332722a28947da394dbb66647129ddbd')

prepare() {
  sed -i '/sse/d;/SSE/d' $pkgname-$pkgver/CMakeLists.txt
  _patch_ "$pkgname-$pkgver"
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_BINDIR=bin \
    -D CMAKE_INSTALL_DATADIR=/usr/share \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S $pkgname-$pkgver
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
