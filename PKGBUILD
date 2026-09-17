# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=frzscr
pkgver=1.1.0
pkgrel=1
pkgdesc='Screen freezing program for Wayland'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/heather7283/frzscr
license=(GPL-3.0-only)
depends=(musl wayland)
makedepends=(meson wayland-protocols)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(26da367c8275c62fbe44890bae4a7c9be0d40430076f4ae25428964f9ca91b52)

build() {
  ewe-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
