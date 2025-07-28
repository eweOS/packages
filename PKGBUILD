# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wofi
pkgver=1.5
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
sha512sums=('5c3e7dd79b2a2bf2651defd822a3d2d49a416b570eb88cbf696fac1e90db878ad0e3a3ae51ca1611a04f00e61d142cc4bdd1aee4d4a1a1def6109936bf51c44c')

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
