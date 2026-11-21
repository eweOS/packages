# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=zig
pkgver=0.17.1
pkgrel=1
pkgdesc='Toolchain for the Zig language'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://ziglang.org
license=(MIT)
depends=(clang llvm llvm-libs musl zlib-ng zstd)
makedepends=(cmake lld llvm-devel ninja)
source=(
  $url/download/$pkgver/$pkgname-$pkgver.tar.xz
  drop-targets.patch
)
sha256sums=('1e89bf06610b769a8c77676c6c8d54b093a0db60f4891f2f91014829012f0e24'
            '93a4e68b7ee85c5d71454ec044d9c9f1e6c4c5f360a077c77f56c63920eb58b5')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  local cmake_vars=(
    CMAKE_BUILD_TYPE=None
    CMAKE_INSTALL_PREFIX=/usr
    ZIG_VERSION=$pkgver
    ZIG_PIE=ON
    ZIG_TARGET_TRIPLE=$CARCH-linux-musl
    ZIG_TARGET_MCPU=baseline
    ZIG_USE_LLVM_CONFIG=ON
    ZIG_RELEASE_SAFE=ON
  )
  cmake -S $pkgname-$pkgver -B build ${cmake_vars[@]/#/-D} -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgname-$pkgver/LICENSE
}
