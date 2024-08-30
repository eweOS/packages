# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libshumate
pkgname=(
  libshumate
  libshumate-docs
)
pkgver=1.2.3
pkgrel=1
pkgdesc="Map widget for GTK 4"
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL-2.1-or-later)
arch=(x86_64 aarch64 riscv64)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  graphene
  gtk4
  json-glib
  libsoup3
  pango
  protobuf-c
  sqlite
)
makedepends=(
  gi-docgen
  git
  glib2
  gobject-introspection
  gperf
  meson
  vala
)
checkdepends=(weston)
source=(
  "git+https://gitlab.gnome.org/GNOME/libshumate.git#tag=${pkgver/[a-z]/.&}"
  fix-test.patch
)
sha256sums=('560b3ff0bb95e06ff60d3e4a850fec00a5bd0ab26563b2e64c4246f979a58564'
            '271aac8098b23e8df3ed1f13588b462c55792c21911db5f975469d71078b00ef')

prepare() {
  _patch_ $pkgname
}

build() {
  local meson_options=(
    --buildtype debugoptimized  # Required for tests
    -D sysprof=disabled
    -D demos=true
  )

  ewe-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT
  GTK_A11Y=none dbus-run-session \
    meson test -C build --print-errorlogs
}

package_libshumate() {
  provides=(libshumate-1.0.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libshumate-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
