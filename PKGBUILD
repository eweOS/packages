# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk3
pkgver=3.24.43
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
  at-spi2-core
  desktop-file-utils
)
makedepends=(
  meson
  sassc
  wayland-protocols
  gobject-introspection
  linux-headers
)
source=(
  "https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz"
  gtk-query-immodules-3.0.hook
)
sha256sums=('ab197f76719fc875067671247533f8e5bd2bc090568ec17317de410d06397b7f'
            '554a03b0b36b0e69b74cdc917c3ed1a36d31f68c3fe36c7dab787e5dd6c3a5d0')

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
  install=gtk3.install
  depends+=(gtk-update-icon-cache adwaita-icon-theme)
  meson install -C build --destdir "$pkgdir"

  # Built by GTK 4, shared with GTK 3
  rm $pkgdir/usr/bin/gtk-update-icon-cache

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook
}
