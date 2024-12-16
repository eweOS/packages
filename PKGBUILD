# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blosc
pkgver=1.21.6
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
sha512sums=('f32ac9ca7dd473f32201cdf4b7bb61a89e8bc3e3d16e027d2c6dc1aa838cb47c42dfed6942c9108532b3920ed22a8c662e7451890177c9bbe6ec5b8ab65362b3')

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
    -D PREFER_EXTERNAL_ZSTD="ON"

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
