# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zxing-cpp
pkgver=3.2.0
pkgrel=1
pkgdesc='A C++ library to decode QRCode'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/nu-book/zxing-cpp'
license=(Apache-2.0)
depends=(zint)
makedepends=(cmake stb git)
checkdepends=(gtest)
source=(
  https://github.com/nu-book/zxing-cpp/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
sha256sums=('0cf0921252cfdff4efacdeb2825429db3ca92b3aa5876c757c7495bb312768b6')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DZXING_EXAMPLES=OFF \
    -DZXING_UNIT_TESTS=ON \
    -DZXING_USE_BUNDLED_ZINT=OFF \
    -DCMAKE_CXX_STANDARD=20 \
    -DSTB_IMAGE_INCLUDE_DIR=/usr/include/stb
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
