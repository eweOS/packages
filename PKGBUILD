# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libshumate
pkgname=(
  libshumate
  libshumate-docs
)
pkgver=1.3.2
pkgrel=1
pkgdesc="Map widget for GTK 4"
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL-2.1-or-later)
arch=(x86_64 aarch64 riscv64 loongarch64)
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
)
sha256sums=('2a30ab3b4b03b5873c8857eb31f7437870ae15c56e4382353bd728b45e8789d6')

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
