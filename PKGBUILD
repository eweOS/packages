# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=gtklock
pkgver=3.0.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-session-lock)
makedepends=(meson scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a65e8636680c1fb11c449ecb0c88771345a9535150b7a372bc615def6bea2c7c')

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
