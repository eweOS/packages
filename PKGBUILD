# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tomlplusplus
pkgver=3.5.1
pkgrel=1
pkgdesc="Header-only TOML config file parser and serializer for C++17"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://marzer.github.io/tomlplusplus/"
license=(MIT)
makedepends=(cmake meson)
provides=(libtomlplusplus.so)
source=($pkgname-$pkgver.tar.gz::https://github.com/marzer/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4821c769370a6489b6a37814f16f3769eee0f2e733a5c129d5d99e2515a95c2b')

build() {
  # Upstream defaults to header-only; keep the shared library.
  ewe-meson $pkgname-$pkgver build -Dbuild_lib=true
  ninja -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

