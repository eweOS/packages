# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-weather
pkgver=47.0
pkgrel=1
pkgdesc="Access current weather conditions and forecasts"
url="https://apps.gnome.org/Weather"
arch=(any)
license=(GPL-2.0-or-later)
depends=(
  dconf
  geoclue
  gjs
  gtk4
  hicolor-icon-theme
  libadwaita
  libgweather-4
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-weather.git#tag=${pkgver/[a-z]/.&}")
sha256sums=('d61ec7e9a6574424512b818b3995037835aa924b7c59e2dad1e8e018884e0f55')

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
