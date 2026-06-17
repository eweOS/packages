# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fast_float
pkgver=8.2.10
pkgrel=1
pkgdesc='Fast and exact implementation of the C++ from_chars functions for float and double types'
arch=('any')
url="https://github.com/fastfloat/$pkgname"
license=('Apache-2.0' 'BSL-1.0' 'MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76f958dd97b1cf4d8862d1f0986a47d4bdfa8845252bae15ef0f40de3b95961f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
