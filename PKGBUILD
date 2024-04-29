# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wofi
pkgver=1.4.1
pkgrel=1
pkgdesc='launcher for wlroots-based wayland compositors'
arch=(x86_64 aarch64 riscv64)
url='https://hg.sr.ht/~scoopta/wofi'
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gdk-pixbuf'
  'glib'
  'gtk3'
  'pango'
  'wayland'
)
makedepends=(meson)
source=("${pkgname}-v${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('a84aa9c7ae1d454a7e419e81d54dd266fb97eae6c0c8961f1631f403484f1226a6dac8d85c7bd942558b845486e4351aa8d981f021461bc336520bdc7f429944')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
