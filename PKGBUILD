# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wofi
pkgver=1.5.1
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
sha512sums=('6c0a05e68022c64506b2a2d0b12c8f4a874070bfe598a371d6508c1faf62d967b76affcc4b41a1eaba294fbad3cae9f3ee84f6715df89bd353d44d41631e893c')

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
