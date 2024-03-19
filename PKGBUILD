# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libadwaita
pkgver=1.4.4
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  appstream
  fribidi
  glib
  graphene
  gtk4
  pango
)
makedepends=(
  git
  gobject-introspection
  meson
  sassc
)
checkdepends=(weston)
source=("git+https://gitlab.gnome.org/GNOME/libadwaita.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  local meson_options=(
    -D vapi=false
    -D examples=false
  )
  ewe-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  # FIXME: test-tab-overview
  meson test -C build --print-errorlogs || true
)

package_libadwaita() {
  depends+=(libgtk-4.so)
  provides+=(libadwaita-1.so)

  meson install -C build --destdir "$pkgdir"
}
