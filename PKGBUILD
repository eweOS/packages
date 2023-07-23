# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk3
pkgver=3.24.38
pkgrel=1
pkgdesc="Multi-platform toolkit for creating graphical user interfaces"
url="https://www.gtk.org/"
arch=(x86_64 aarch64)
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
  libegl
  libxkbcommon
  graphene
  libepoxy
  at-spi2-core
)
makedepends=(
  meson
  binutils-gold
  binutils-objcopy
  sassc
  wayland-protocols
  gobject-introspection
)
source=("https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz")
sha256sums=('6cdf7189322b8465745fbb30249044d05b792a8f006746ccce9213db671ec16d')

build()
{
  mkdir -p $srcdir/binutils-bin && cp /usr/bin/binutils-objcopy $srcdir/binutils-bin/objcopy
  export PATH="$srcdir/binutils-bin:$PATH"
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
  LD=binutils-gold ewe-meson gtk-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
