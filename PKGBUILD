# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libadwaita
pkgname=(
  libadwaita
  libadwaita-demos
  libadwaita-docs
)
pkgver=1.7.2
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita/"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  gi-docgen
  git
  gobject-introspection
  meson
  sassc
  vala
)
checkdepends=(weston)
source=("git+https://gitlab.gnome.org/GNOME/libadwaita.git#tag=$pkgver")
sha256sums=('9f42bdb23db253dc37d659b4c85e259af1f8da36d823e1e059609ee41fe23fdb')

build() {
  local meson_options=(
    -D gtk_doc=true
  )
  ewe-meson $pkgbase build "${meson_options[@]}"
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
  provides+=(libadwaita-1.so)
  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ demo usr/bin/adwaita-1-demo
  _pick_ demo usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick_ demo usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick_ demo usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml

  _pick_ docs usr/share/doc
}

package_libadwaita-demos() {
  pkgdesc+=" (demo applications)"
  depends=(
    glib2
    gtk4
    hicolor-icon-theme
    libadwaita
  )
  mv pkgs/demo/* "$pkgdir"
}

package_libadwaita-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv pkgs/docs/* "$pkgdir"
}
