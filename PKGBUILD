# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-calculator
pkgver=51.1
pkgrel=1
pkgdesc="GNOME Scientific calculator"
url="https://apps.gnome.org/Calculator"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libgee
  libmpc
  libsoup3
  libxml2
  mpfr
)
makedepends=(
  blueprint-compiler
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
provides=(
  libgcalc-2.so
  libgci-1.so
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-calculator.git#tag=${pkgver/[a-z]/.&}")
sha256sums=('53b9e072f73f7c32ce34cf37b66a7c628210949d68f9ca73a6b39e40fa7b525f')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
