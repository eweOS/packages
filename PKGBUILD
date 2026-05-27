# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zxing-cpp
pkgver=3.0.2
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
  system-stb.patch
)
sha256sums=('b063dacf384c7bb93ab2c3eea247cc06b4525330f0efa631907aa3029f7e2144'
            'cc83c917902c3551ff0a4b7752baf895044d40901eba74678aeef19e236266f1')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DZXING_EXAMPLES=OFF \
    -DZXING_UNIT_TESTS=ON \
    -DZXING_USE_BUNDLED_ZINT=OFF \
    -DCMAKE_CXX_STANDARD=20
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
