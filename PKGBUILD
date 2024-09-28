# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gsettings-desktop-schemas
pkgname=(
  gsettings-desktop-schemas
  gsettings-system-schemas
)
pkgver=47.1
pkgrel=2
pkgdesc="GSettings schemas for GNOME"
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
arch=(any)
license=(LGPL-2.1-or-later)
makedepends=(
  dconf
  git
  glib2
  gobject-introspection
  meson
)
source=("git+$url.git#tag=${pkgver/[a-z]/.&}")
sha256sums=('e07c93ff3d6e777b685d7a8d47b3f460b0d8d6068e08adba210c8834871a5396')

build() {
  ewe-meson $pkgbase build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_gsettings-desktop-schemas() {
  pkgdesc+=" desktop components"
  depends=(
    "gsettings-system-schemas=$pkgver-$pkgrel"
    dconf
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"
  _pick_ system usr/share/glib-2.0/schemas/org.gnome.desktop.enums.xml
  _pick_ system usr/share/glib-2.0/schemas/org.gnome.system.*.gschema.xml
}

package_gsettings-system-schemas() {
  pkgdesc+=" system components"
  depends=(dconf)

  mv pkgs/system/* "$pkgdir"
}
