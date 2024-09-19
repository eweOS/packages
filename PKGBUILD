# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gsettings-desktop-schemas
pkgver=47.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
arch=(any)
license=(LGPL-2.1-or-later)
depends=(dconf glib2)
makedepends=(git gobject-introspection meson)
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#tag=$pkgver")
sha256sums=('e07c93ff3d6e777b685d7a8d47b3f460b0d8d6068e08adba210c8834871a5396')

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
