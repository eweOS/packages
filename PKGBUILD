# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-maps
pkgver=50.0
pkgrel=1
pkgdesc="Find places around the world"
url="https://apps.gnome.org/Maps"
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  hicolor-icon-theme
  geoclue
  geocode-glib-2
  gjs
  glib2
  gtk4
  json-glib
  libadwaita
  libgweather-4
  libportal
  librest
  librsvg
  libshumate
  libxml2
  pango
)
makedepends=(
  git
  gobject-introspection
  meson
  yelp-tools
)
checkdepends=(gnome-keyring tzdata)
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-maps.git#tag=${pkgver/[a-z]/.&}"
)
sha256sums=('fc02af0336e1f48881113accd42f06a37a77a6abe0b32ab2a6103b34ba1ba825')

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
