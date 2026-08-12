# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=c3c
pkgver=0.8.3
pkgrel=1
pkgdesc='Compiler for the C3 language'
arch=(x86_64 aarch64 riscv64)
url=https://c3-lang.org
license=(LGPL-3.0-or-later MIT)
depends=(curl llvm-libs musl zstd)
makedepends=(cmake lld llvm-devel ninja)
# This patch are from downstream.
# 0001: Add C3_ARM_DISABLE.
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/c3lang/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  0001-add-arm-disable.patch
)
sha256sums=(
  95e6b7fdf74eb150bbfc8b2128e8d9818a116e7bdd2a8c5f092d58168b17b13b
  cbbc14146f155f75d370b2f97626ea1a5d0f28df2c9ba0f5e9fd976d1ae62cda
)

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  local cmake_vars=(
    C3_ARM_DISABLE=ON
    C3_AVR_DISABLE=ON
    CMAKE_BUILD_TYPE=Release
    CMAKE_C_FLAGS_RELEASE="$CFLAGS"
    CMAKE_CXX_FLAGS_RELEASE="$CXXFlAGS"
    CMAKE_INSTALL_PREFIX=/usr
  )
  cmake -S $pkgname-$pkgver -B build "${cmake_vars[@]/#/-D}" -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd $pkgname-$pkgver
  _install_license_ LICENSE LICENSE
  _install_license_ LICENSE_SRC LICENSE_SRC
}
