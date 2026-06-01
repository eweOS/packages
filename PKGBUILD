# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gsettings-desktop-schemas
pkgname=(
  gsettings-desktop-schemas
  gsettings-system-schemas
)
pkgver=50.1
pkgrel=1
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
sha256sums=('bbe9bc844ce0e5b8f7a4b35b53b18695c96af6f101a75d0beb029cb5271d1c05')

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
