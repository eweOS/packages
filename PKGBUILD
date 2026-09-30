# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=fcitx5-rime
pkgver=5.1.16
pkgrel=1
pkgdesc='RIME support for Fcitx5'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/fcitx/fcitx5-rime
license=(LGPL-2.1-or-later)
depends=(fcitx5 librime llvm-libs musl rime-prelude)
makedepends=(cmake extra-cmake-modules ninja)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(30cc0a39099dd1b36a2bd291947c137c85eb0339acfabc1412b9e14b70128f66)

build() {
  cmake -S $pkgbase-$pkgver -B build -D CMAKE_INSTALL_PREFIX=/usr -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgbase-$pkgver/LICENSES/$license.txt
}
