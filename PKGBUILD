# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zxing-cpp
pkgver=2.3.0
pkgrel=1
pkgdesc='A C++ library to decode QRCode'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/nu-book/zxing-cpp'
license=(Apache-2.0)
makedepends=(cmake)
checkdepends=(gtest)
source=(https://github.com/nu-book/zxing-cpp/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('64e4139103fdbc57752698ee15b5f0b0f7af9a0331ecbdc492047e0772c417ba')

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
