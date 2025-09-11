# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cjson
pkgver=1.7.19
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("MIT")
makedepends=("cmake" "ninja")
url="https://github.com/DaveGamble/cJSON"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('7b22bdd05b8e0bf8b24ab79db128dbab9f8c2c167f4b1d3073922b8ff1e0f0e8917322283d6d4091002f014f42692984f4f641761f05965d3b66fb3eca14dc46')

prepare() {
  sed -i 's/std=c89/std=gnu99/' cJSON-${pkgver}/CMakeLists.txt
}

build() {
  cmake -G Ninja -B build -S "cJSON-${pkgver}" -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR=$pkgdir cmake --install build
  install -Dm644 "$srcdir/cJSON-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
