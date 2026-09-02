# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=json-c
pkgver=0.19
pkgrel=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=(cmake ninja)
provides=(libjson-c.so)
_datetag=20260627
source=(
  "https://github.com/json-c/json-c/archive/refs/tags/json-c-$pkgver-$_datetag.tar.gz"
)
sha256sums=('f17a6d7d265cf840dfd8f0f46a606d98c6b5b26dc7cfe27275d1546a213086c8')

build() {
  cd "$srcdir"
  cmake -S "$pkgname-$pkgname-$pkgver-$_datetag" -B build -G Ninja \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_THREADING=ON \
    -DENABLE_RDRAND=OFF \
    -DDISABLE_WERROR=ON
  cmake --build build
}

check() {
  USE_VALGRIND=0 ctest --test-dir build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ "$pkgname-$pkgname-$pkgver-$_datetag"/COPYING
}
