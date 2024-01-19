# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tomlplusplus
pkgver=3.4.0
pkgrel=1
pkgdesc="Header-only TOML config file parser and serializer for C++17"
arch=(x86_64 aarch64 riscv64)
url="https://marzer.github.io/tomlplusplus/"
license=(MIT)
makedepends=(cmake meson)
provides=(libtomlplusplus.so)
source=($pkgname-$pkgver.tar.gz::https://github.com/marzer/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155')

build() {
  ewe-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

