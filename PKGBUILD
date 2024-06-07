# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtksourceview
pkgver=5.12.1
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
provides=(gtksourceview5)
depends=(
  cairo
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  gtk4
  hicolor-icon-theme
  libxml2
  pango
  pcre2
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
)
checkdepends=(weston)
source=("git+https://gitlab.gnome.org/GNOME/gtksourceview.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson gtksourceview build
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


package() {
  provides+=(libgtksourceview-${pkgver%%.*}.so)

  meson install -C build --destdir "$pkgdir"
}
