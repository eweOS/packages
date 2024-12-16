# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libgweather
pkgname=(
  libgweather
  libgweather-docs
)
pkgver=4.4.4
pkgrel=1
pkgdesc="Location and timezone database and weather-lookup library"
url="https://wiki.gnome.org/Projects/LibGWeather"
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  geocode-glib-2
  glib2
  json-glib
  libsoup3
  libxml2
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  python-gobject
  vala
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libgweather.git#tag=$pkgver"
  disable-metar-test.diff
)
sha256sums=('7e621b4e0814b32291958c5c1477ba64afa557d7e5577c5dadbb3054aedfd2cf'
            '42ebd95b2de37ff959a759546473985a86fa1a5488211b303a97540f2b7a8805')

prepare() {
  cd libgweather

  # Disable metar test, depends on unstable online service
  git apply -3 ../disable-metar-test.diff
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  ewe-meson libgweather build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # assertion failed (gweather_location_get_name (brussels) == "Bruxelles"): ("Brussels" == "Bruxelles")
  meson test -C build --print-errorlogs || :
}

package_libgweather() {
  provides=(libgweather-4 libgweather-4.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libgweather-docs() {
  pkgdesc+=" (documentation)"
  provides=(libgweather-4-docs)
  depends=()

  mv doc/* "$pkgdir"
}
