# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtksourceview5
pkgver=5.13.0
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
provides=(gtksourceview libgtksourceview-5.so)
conflicts=(gtksourceview)
replaces=(gtksourceview)
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
source=("https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/$pkgver/gtksourceview-$pkgver.tar.gz")
sha256sums=('fd0f6e37294d6e1311dcc1af2d4c54019d0a58afbaf1eb1c2aa1ffafc3ff966d')

build() {
  ewe-meson gtksourceview-$pkgver build
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
