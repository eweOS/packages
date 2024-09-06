# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyxml2
pkgver=10.0.0
pkgrel=1
pkgdesc='Simple XML parser made for easy integration'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/leethomason/tinyxml2'
license=('custom:zlib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D tinyxml2_SHARED_LIBS=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
