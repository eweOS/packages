# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk4
pkgver=4.8.3
pkgrel=1
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
)
makedepends=(
  meson
  binutils-gold
  binutils-objcopy
  sassc
  wayland-protocols
  gobject-introspection
)
checkdepends=(weston)
source=("https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz")
sha256sums=('db1779168d6bf3bb6c0564da82f6263206846d8ffea56adb421eec9b6a625305')

build()
{
  mkdir -p $srcdir/binutils-bin && cp /usr/bin/binutils-objcopy $srcdir/binutils-bin/objcopy
  export PATH="$srcdir/binutils-bin:$PATH"
  local meson_options=(
    --libdir=lib
    -D x11-backend=false
    -D broadway-backend=false
    -D media-gstreamer=disabled
    -D print-cups=disabled
    -D demos=false
    -D build-examples=false
    -D build-tests=false
  )
  LD=binutils-gold ewe-meson gtk-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

# Checks are ignored due to execinfo.h is missing in musl

package()
{
  meson install -C build --destdir "$pkgdir"
}
