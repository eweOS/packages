# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libgexiv2
pkgver=0.14.6
pkgrel=1
pkgdesc="GObject-based wrapper around the Exiv2 library"
url="https://gitlab.gnome.org/GNOME/gexiv2"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(
  exiv2
  glib2
)
makedepends=(
  git
  glib2
  gobject-introspection
  gtk-doc
  meson
  python-gobject
  vala
)
source=("git+$url.git#tag=gexiv2-$pkgver")
sha256sums=('400681aeb4bb5d6a2e5bad1b6a4648aef553f3a802769b68e1f61aaede7926c1')

build() {
  local meson_options=(
    -D gtk_doc=true
    -D tests=true
  )

  ewe-meson gexiv2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libg{lib,object,io}-2.0.so
    libexiv2.so
  )
  provides+=(libgexiv2.so)

  meson install -C build --destdir "$pkgdir"
}
