# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-calculator
pkgver=47.0
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
sha256sums=('SKIP')

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
