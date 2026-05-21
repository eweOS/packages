# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libnotify
pkgname=(
  libnotify
  libnotify-docs
)
pkgver=0.8.8
pkgrel=2
pkgdesc="Library for sending desktop notifications"
url="https://gitlab.gnome.org/GNOME/libnotify"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(gdk-pixbuf2 glib2 musl)
makedepends=(
  docbook-xsl
  gi-docgen
  git
  gobject-introspection
  meson
  xmlto
)
checkdepends=(
  dbus
  gtk4
  python-dbusmock
  python-gobject
  weston
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('7532242aaba07743eb379599e14d481e71051182345f4c0c9c3821e9098cc2a7')

build() {
  ewe-meson $pkgname build
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

package_libnotify() {
  provides=(libnotify.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libnotify-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
