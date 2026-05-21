# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtksourceview5
pkgver=5.20.0
pkgrel=2
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('1d1c63c38e1d85438ac824ad55c2e9a03728c0b05441d6cbb8781e4bc9222a17')

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
    meson test -C build --print-errorlogs --timeout-multiplier=10
}


package() {
  provides+=(libgtksourceview-${pkgver%%.*}.so)

  meson install -C build --destdir "$pkgdir"
}
