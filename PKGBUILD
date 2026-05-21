# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=geoclue
pkgver=2.8.1
pkgrel=2
pkgdesc="Modular geoinformation service built on the D-Bus messaging system"
url="https://gitlab.freedesktop.org/geoclue/geoclue/-/wikis/home"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(
  LGPL-2.1-or-later
  GPL-2.0-or-later
)
depends=(
  glib2
  json-glib
  libsoup3
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  libnotify
  meson
  vala
)
optdepends=('libnotify: Demo Agent')
backup=(etc/geoclue/geoclue.conf)
source=(
  "git+https://gitlab.freedesktop.org/geoclue/geoclue.git#tag=$pkgver"
)
sha256sums=('30767211452388b2d8599355b29e6fcd637ebcb5c07be521ee96c752725827d3')

# provided by geoclue
_wifiurl="https://api.positon.xyz/v1/geolocate?key=56aba903-ae67-4f26-919b-15288b44bda9"

build() {
  local meson_options=(
    -D dbus-srv-user=geoclue
    -D nmea-source=false
    -D 3g-source=false
    -D cdma-source=false
    -D modem-gps-source=false
    -D default-wifi-url="$_wifiurl"
  )

  ewe-meson geoclue build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  echo 'd /var/lib/geoclue 0755 geoclue geoclue -' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/geoclue.conf"
}
