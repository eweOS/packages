# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blosc
pkgver=1.21.7
pkgrel=1
pkgdesc='A blocking, shuffling and loss-less compression library'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://www.blosc.org'
license=('BSD-3-Clause')
depends=(
  'lz4'
  'snappy'
  'zlib'
  'zstd'
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/c-blosc/archive/v${pkgver}.tar.gz")
sha512sums=('ff8eedac003c8a972dad59e0cf787c3c329ff031b02e94d63ae99a0228ea4a50a6e6b80492916b66f6bd42aea5ed9cf4bec87b47df83a01cf98f4c68ff3b28c5')

prepare() {
  cd "c-blosc-$pkgver"
  sed -i '1i #include <time.h>' bench/bench.c
}

build() {
  cmake \
    -B build \
    -S "c-blosc-$pkgver" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D BUILD_STATIC="OFF" \
    -D DEACTIVATE_SNAPPY="OFF" \
    -D PREFER_EXTERNAL_LZ4="ON" \
    -D PREFER_EXTERNAL_ZLIB="ON" \
    -D PREFER_EXTERNAL_ZSTD="ON" \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build
}

check() {
  cd build

  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 \
    "c-blosc-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
