# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=snappy
pkgver=1.2.1
pkgrel=1
pkgdesc='A fast compressor/decompressor library'
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/google/snappy"
license=('BSD-3-Clause')
makedepends=(
  'clang'
  'cmake'
  'gtest'
)
checkdepends=('zlib')
provides=('libsnappy.so')
source=(
  "$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  snappy.pc.in
  cmake_add_pkgconfig.patch
  use_system_gtest.patch
  reenable_rtti.patch::https://github.com/google/snappy/commit/516fdcca6606502e2d562d20c01b225c8d066739.patch
)
sha256sums=('736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86'
            '134f06ca0584a1026538d0fb972fc141c008390ecae1806184b721eca1abbc75'
            '2a204d7d35509ffc290d80c641fcb7e8488c67ca550aa1695493cff12c53156b'
            '50b31b45511e8907f1319305c102f37631b0fbe509f862b612e70073383658e4'
            '5c9a3be0cabfc58f091a6ba51b05a1627a39693695ab91a6260cecc982e9a6b5')

prepare() {
  _patch_ "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cp ../snappy.pc.in .
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev \
    -DCMAKE_CXX_STANDARD=23 \
    -DBUILD_SHARED_LIBS=ON \
    -DSNAPPY_BUILD_BENCHMARKS=OFF
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  cmake --build build --target test
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
