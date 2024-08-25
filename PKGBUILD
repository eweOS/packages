# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cjson
pkgver=1.7.18
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=(x86_64 aarch64 riscv64)
license=("MIT")
makedepends=("cmake" "ninja")
url="https://github.com/DaveGamble/cJSON"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('2accb507c6b97222eb5f0232c015b356cf6d248d1247049928731aa8e897378245e62395c232b1ec57d28d1e53ac72c849be85e59c33616a382d40473649f66b')

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
