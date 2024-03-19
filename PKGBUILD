# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk3
pkgver=3.24.38
pkgrel=5
pkgdesc="Multi-platform toolkit for creating graphical user interfaces"
url="https://www.gtk.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  cairo
  fontconfig
  fribidi
  glib
  harfbuzz
  libepoxy
  pango
  wayland
  gdk-pixbuf
  libtiff
  libjpeg
  libxkbcommon
  graphene
  libepoxy
  at-spi2-core
)
makedepends=(
  meson
  sassc
  wayland-protocols
  gobject-introspection
)
source=("https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz")
sha256sums=('6cdf7189322b8465745fbb30249044d05b792a8f006746ccce9213db671ec16d')

build()
{
  local meson_options=(
    --libdir=lib
    -D x11_backend=false
    -D broadway_backend=false
    -D win32_backend=false
    -D quartz_backend=false
    -D demos=false
    -D examples=false
    -D tests=false
  )
  ewe-meson gtk-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

package()
{
  depends+=(gtk-update-icon-cache)
  meson install -C build --destdir "$pkgdir"

  # Built by GTK 4, shared with GTK 3
  rm $pkgdir/usr/bin/gtk-update-icon-cache
}
