# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zxing-cpp
pkgver=2.2.1
pkgrel=1
pkgdesc='A C++ library to decode QRCode'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/nu-book/zxing-cpp'
license=(Apache)
makedepends=(cmake)
checkdepends=(gtest)
source=(https://github.com/nu-book/zxing-cpp/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_UNIT_TESTS=ON \
    -DCMAKE_CXX_STANDARD=20
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
