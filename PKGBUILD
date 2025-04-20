# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libnotify
pkgname=(
  libnotify
  libnotify-docs
)
pkgver=0.8.6
pkgrel=1
pkgdesc="Library for sending desktop notifications"
url="https://gitlab.gnome.org/GNOME/libnotify"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(gdk-pixbuf2)
makedepends=(
  docbook-xsl
  gi-docgen
  git
  gobject-introspection
  gtk3
  meson
  xmlto
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('ddf605b355e2dadfeb488114b7e5f91ebdda1bb12abe04d6d3e8356a4ef7d6ec')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
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
