# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wofi
pkgver=1.5.3
pkgrel=1
pkgdesc='launcher for wlroots-based wayland compositors'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha512sums=('59067d8ea080cde13ba4c278e5843e10300c9fd5e1a1445107f6045d01c23b2ceaf59cd3e0393c3d966553b04110c3ebb776b88df39885dd06620d3e49c8ffff')

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
