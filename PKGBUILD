# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gsettings-desktop-schemas
pkgver=46.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
arch=(any)
license=(LGPL-2.1-or-later)
depends=(dconf glib2)
makedepends=(git gobject-introspection meson)
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git#tag=$pkgver")
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
