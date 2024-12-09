# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtksourceview5
pkgver=5.14.2
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
sha256sums=('4b9afe0a72a75082de9e7d00a0e176696653ce23da0a5f2e9b9eafcfb4edfc00')

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
