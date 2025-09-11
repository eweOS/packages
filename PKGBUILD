# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cjson
pkgver=1.7.19
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("MIT")
depends=("musl")
makedepends=("cmake" "ninja")
url="https://github.com/DaveGamble/cJSON"
provides=("libcjson.so" "libcjson_utils.so")
# 0001: Under review, raise CMake version to fix build with CMake 4.0
#	https://github.com/DaveGamble/cJSON/pull/935
# 0002: Should be upstreamed, raise C language version to C99 to allow usage of
#	long long types.
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz"
	"0001-Make-compatible-with-CMake-4.0.patch"
	"0002-raise-C-language-to-c99.patch")
sha512sums=('7b22bdd05b8e0bf8b24ab79db128dbab9f8c2c167f4b1d3073922b8ff1e0f0e8917322283d6d4091002f014f42692984f4f641761f05965d3b66fb3eca14dc46'
            '81648a50656e4677662905b5b84742524b212f3086ec33e5364eac1aee56d5eedee17c7982ad44687436be0a63b542ac981910afa2ebc8dc417c25d9b05462e4'
            '5244b03be30973a4d1e97e846a71698a0ad9312b22938c25a64e0defce1162e3cbdcb0720d5ed6ac26300810f8103b077451d982a9770c59ec44f490fa8de6e5')

prepare() {
  _patch_ "cJSON-${pkgver}"
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
