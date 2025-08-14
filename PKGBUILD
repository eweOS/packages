# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=highway
pkgver=1.3.0
pkgrel=1
pkgdesc='A C++ library that provides portable SIMD/vector intrinsics'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/google/highway/'
license=('Apache-2.0' 'BSD-3-Clause')
makedepends=('cmake' 'gtest' 'linux-headers')
source=(
  "https://github.com/google/highway/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('07b3c1ba2c1096878a85a31a5b9b3757427af963b1141ca904db2f9f4afe0bc2')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
	-DHWY_CMAKE_RVV:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "$pkgname-$pkgver/LICENSE-BSD3" -t "$pkgdir/usr/share/licenses/$pkgname"
}
