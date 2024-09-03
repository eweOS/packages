# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtkmm
pkgver=4.14.0
pkgrel=1
pkgdesc="C++ bindings for GTK 4"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  gtk4
  pangomm
  cairomm
  glibmm
  libsigc++3
)
makedepends=(
  git
  meson
  mm-common
  perl-xml-parser
)
checkdepends=(weston)
source=("git+https://gitlab.gnome.org/GNOME/gtkmm.git#tag=$pkgver")
sha256sums=('9ea08c49f3642246befbe39ea4f650743346f4d9520ee1877e9d125e40134efd')

build() {
  local meson_options=(
    -D maintainer-mode=true
    -D build-documentation=false
  )

  ewe-meson gtkmm build "${meson_options[@]}"
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs
}

package() {
  provides=(libgtkmm-4.0.so gtkmm-gtk4 gtkmm-4.0)
  options=(!emptydirs)

  meson install -C build --destdir "$pkgdir"
}
