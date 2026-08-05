# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=fcitx5-rime
pkgver=5.1.14
pkgrel=1
pkgdesc='RIME support for Fcitx5'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/fcitx/fcitx5-rime
license=(LGPL-2.1-or-later)
depends=(fcitx5 librime llvm-libs musl rime-prelude)
makedepends=(cmake extra-cmake-modules ninja)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(8f6513eeb06f3d28d831eb0a33e439f63258c58673107aaa05ecef401cf393f6)

build() {
  cmake -S $pkgbase-$pkgver -B build -D CMAKE_INSTALL_PREFIX=/usr -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgbase-$pkgver/LICENSES/$license.txt
}
